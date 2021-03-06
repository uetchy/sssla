#  Sssla - morphological analizer
# 
#  Copyright (C) 2001 TAKAOKA Kazuma. All rights reserved.
# 
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above
#     copyright notice, this list of conditions and the following
#     disclaimer in the documentation and/or other materials provided
#     with the distribution.
#  3. The name of the author may not be used to endorse or promote
#     products derived from this software without specific prior
#     written permission.
# 
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
#  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
#  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
#  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
#  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $Id: pos.rb,v 1.2 2001/12/06 16:06:09 kazuma-t Exp $

class Sssla
  class POS
    attr_accessor :name, :fullname
    attr_accessor :path
    attr_accessor :is_inflect, :weight
    def initialize
      @name = []
      @path = []
      @is_inflect = false
      @weight = 1
    end
  end
  class POSTable
    def initialize(pos_file)
      @poses = Marshal.load(open(pos_file))
      @poses[0].weight = 0
#      @poses[0].name = 'EOS'
    end
    def get_fullname(pos_id)
      @poses[pos_id].fullname
    end
    def get_name(pos_id, depth)
      @poses[pos_id].name[0...depth].join('-')
    end
    def get_weight(pos_id)
      @poses[pos_id].weight
    end
    def get_pos_id(name)
      @poses.each_index do |i|
	if get_fullname(i) == name then
	  return i
	end
      end
      -1
    end
  end
end

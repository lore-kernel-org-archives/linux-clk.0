Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1511807134.6812.10.camel@baylibre.com>
Subject: [GIT PULL] : clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Quentin Schulz
 <quentin.schulz@free-electrons.com>
Date: Mon, 27 Nov 2017 19:25:34 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull the v4 of the clock protect patchset [0].
I have done the documentation correction requested by Mike,
added his Ack and Maxime's Tested-By.

Cheers
Jerome

[0]: https://lkml.kernel.org/r/20170924200030.6227-1-jbrunet@baylibre.com

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:   

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)                                   

are available in the Git repository at:                                        

  git://github.com/jeromebrunet/linux.git tags/clk-protect-v4.15-rc1-v4        

for you to fetch changes up to 3e127536c3642adb18cc09d82f93aa31e8364d9d:       

  clk: fix set_rate_range when current rate is out of range (2017-11-27 17:20:12 +0100)                                                                        

----------------------------------------------------------------               
This patchset introduce clock protection to the CCF core. This can then        
be used for:                           

* Provide a way for a consumer to claim exclusivity over the rate control      
  of a provider. Some clock consumers require that a clock rate must not       
  deviate from its selected frequency. There can be several reasons for        
  this, not least of which is that some hardware may not be able to            
  handle or recover from a glitch caused by changing the clock rate while      
  the hardware is in operation. For such HW, The ability to get exclusive      
  control of a clock's rate, and release that exclusivity, could be seen       
  as a fundamental clock rate control primitive. The exclusivity is not        
  preemptible, so when claimed more than once, is rate is effectively          
  locked.                              

* Provide a similar functionality to providers themselves, fixing              
  CLK_SET_RATE_GATE flag (enforce clock gating along the tree). While          
  there might still be a few platforms relying the broken implementation,      
  tests done has shown this change to be pretty safe.                          

----------------------------------------------------------------               
Jerome Brunet (10):                    
      clk: fix incorrect usage of ENOSYS                                       
      clk: take the prepare lock out of clk_core_set_parent                    
      clk: add clk_core_set_phase_nolock function                              
      clk: rework calls to round and determine rate callbacks                  
      clk: use round rate to bail out early in set_rate                        
      clk: add clock protection mechanism to clk core                          
      clk: cosmetic changes to clk_summary debugfs entry                       
      clk: fix CLK_SET_RATE_GATE with clock rate protection                    
      clk: add clk_rate_exclusive api  
      clk: fix set_rate_range when current rate is out of range                

 drivers/clk/clk.c            | 509 +++++++++++++++++++++++++++++++++++++------                                                                                
 include/linux/clk-provider.h |   1 +  
 include/linux/clk.h          |  62 ++++++                                     
 3 files changed, 502 insertions(+), 70 deletions(-)

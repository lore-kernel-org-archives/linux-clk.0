Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
Date: Thu, 4 May 2017 14:25:07 +0200
MIME-Version: 1.0
In-Reply-To: <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

Am 03.05.2017 um 21:53 schrieb Fabio Estevam:
> On Wed, May 3, 2017 at 3:56 PM, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>> Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
>> 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
>> SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
>> to 288 MHz because the initial frequency "seems too high to be ssp clock
>> source directly". However this isn't enough to ensure that the frequency
>> isn't increased later again. In fact this happens on my machine as the
>> mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
>> ssp2 which is resolved to
>>
>>         ref_io1.rate = 320 MHz
>>         ssp2_sel.parent = ref_io1
>>         ssp2_div.divider = 2
>>
>> . The observed effect is that reading MISO reliably fails: Instead of
>> the least significant bit the second least significant bit is reported
>> twice. This is probably related to the reports
>>
>>         https://community.nxp.com/thread/290209
>>         https://community.nxp.com/thread/310434
> Adding Stefan on Cc in he could help testing this patch, as he was the
> one that created this thread.

thanks for forwarding. I tested the patch with Linux 4.11 it on our
Duckbill (i.MX28), but it didn't fix the SPI bit errors with the
QCA7000. Currently the only way to get the QCA7000 working is to switch
the clock parent of ssp2 to ref_xtal (24 MHz).

Is there someone at NXP/Freescale who could explain this behavior?
Are there any relevant register values which could be helpful?

I guess it's a special ratio between ref_io and ssp_div which causes the
issue.

Here are the clk_summary for Linux 4.11 on Duckbill with QCA7000 on ssp
2 for all 3 cases:

1) unpatched (= always bit errors on ssp2)

   clock                         enable_cnt  prepare_cnt        rate  
accuracy   phase
----------------------------------------------------------------------------------------
 ref_xtal                                 5            5   
24000000          0 0
    can1                                  0            0   
24000000          0 0
    can0                                  0            0   
24000000          0 0
    uart                                  2            3   
24000000          0 0
    pwm                                   0            0   
24000000          0 0
    rtc                                   0            0      
31250          0 0
    clk32k_div                            1            1      
32000          0 0
       clk32k                             1            1      
32000          0 0
          lradc                           1            1       
2000          0 0
    emi_xtal                              0            0   
24000000          0 0
    xbus                                  3            3   
24000000          0 0
    cpu_xtal                              0            0   
24000000          0 0
    ptp_sel                               0            0   
24000000          0 0
       ptp                                0            0   
24000000          0 0
    lcdif_sel                             0            0   
24000000          0 0
       lcdif_div                          0            0   
24000000          0 0
          lcdif                           0            0   
24000000          0 0
    etm_sel                               0            0   
24000000          0 0
       etm_div                            0            0   
24000000          0 0
          etm                             0            0   
24000000          0 0
    gpmi_sel                              0            0   
24000000          0 0
       gpmi_div                           0            0   
24000000          0 0
          gpmi                            0            0   
24000000          0 0
    pll2                                  1            1   
50000000          0 0
       enet_out                           1            1   
50000000          0 0
    pll1                                  0            0  
480000000          0 0
       usb1_phy                           0            0  
480000000          0 0
          usb1                            0            0  
480000000          0 0
    pll0                                  5            5  
480000000          0 0
       usb0_phy                           2            2  
480000000          0 0
          usb0                            1            1  
480000000          0 0
       spdif_div                          0            0  
120000000          0 0
          spdif                           0            0  
120000000          0 0
       saif1_sel                          0            0  
480000000          0 0
          saif1_div                       0            0       
7324          0 0
             saif1                        0            0       
7324          0 0
       saif0_sel                          0            0  
480000000          0 0
          saif0_div                       0            0       
7324          0 0
             saif0                        0            0       
7324          0 0
       ref_gpmi                           0            0  
480000000          0 0
       ref_hsadc                          0            0  
480000000          0 0
       ref_pix                            0            0  
480000000          0 0
       ref_io0                            1            1  
288000000          0 0
          ssp1_sel                        0            0  
288000000          0 0
             ssp1_div                     0            0  
288000000          0 0
                ssp1                      0            0  
288000000          0 0
          ssp0_sel                        1            1  
288000000          0 0
             ssp0_div                     1            1   
57600000          0 0
                ssp0                      1            1   
57600000          0 0
       ref_io1                            1            1  
320000000          0 0
          ssp3_sel                        0            0  
320000000          0 0
             ssp3_div                     0            0  
320000000          0 0
                ssp3                      0            0  
320000000          0 0
          ssp2_sel                        1            1  
320000000          0 0
             ssp2_div                     1            1  
160000000          0 0
                ssp2                      1            1  
160000000          0 0
       ref_emi                            1            1  
411428571          0 0
          emi_pll                         1            1  
205714286          0 0
             emi_sel                      1            1  
205714286          0 0
                emi                       1            1  
205714286          0 0
       ref_cpu                            1            1  
454736842          0 0
          cpu_pll                         1            1  
454736842          0 0
             cpu                          2            2  
454736842          0 0
                hbus                      4            4  
151578948          0 0
                   fec                    2            2  
151578948          0 0

2) ref_xtal as clock parent of ssp2 (= no bit errors on ssp2)

   clock                         enable_cnt  prepare_cnt        rate  
accuracy   phase
----------------------------------------------------------------------------------------
 ref_xtal                                 6            6   
24000000          0 0
    can1                                  0            0   
24000000          0 0
    can0                                  0            0   
24000000          0 0
    uart                                  2            3   
24000000          0 0
    pwm                                   0            0   
24000000          0 0
    rtc                                   0            0      
31250          0 0
    clk32k_div                            1            1      
32000          0 0
       clk32k                             1            1      
32000          0 0
          lradc                           1            1       
2000          0 0
    emi_xtal                              0            0   
24000000          0 0
    xbus                                  3            3   
24000000          0 0
    cpu_xtal                              0            0   
24000000          0 0
    ptp_sel                               0            0   
24000000          0 0
       ptp                                0            0   
24000000          0 0
    lcdif_sel                             0            0   
24000000          0 0
       lcdif_div                          0            0   
24000000          0 0
          lcdif                           0            0   
24000000          0 0
    etm_sel                               0            0   
24000000          0 0
       etm_div                            0            0   
24000000          0 0
          etm                             0            0   
24000000          0 0
    ssp2_sel                              1            1   
24000000          0 0
       ssp2_div                           1            1   
24000000          0 0
          ssp2                            1            1   
24000000          0 0
    gpmi_sel                              0            0   
24000000          0 0
       gpmi_div                           0            0   
24000000          0 0
          gpmi                            0            0   
24000000          0 0
    pll2                                  1            1   
50000000          0 0
       enet_out                           1            1   
50000000          0 0
    pll1                                  0            0  
480000000          0 0
       usb1_phy                           0            0  
480000000          0 0
          usb1                            0            0  
480000000          0 0
    pll0                                  4            4  
480000000          0 0
       usb0_phy                           2            2  
480000000          0 0
          usb0                            1            1  
480000000          0 0
       spdif_div                          0            0  
120000000          0 0
          spdif                           0            0  
120000000          0 0
       saif1_sel                          0            0  
480000000          0 0
          saif1_div                       0            0       
7324          0 0
             saif1                        0            0       
7324          0 0
       saif0_sel                          0            0  
480000000          0 0
          saif0_div                       0            0       
7324          0 0
             saif0                        0            0       
7324          0 0
       ref_gpmi                           0            0  
480000000          0 0
       ref_hsadc                          0            0  
480000000          0 0
       ref_pix                            0            0  
480000000          0 0
       ref_io0                            1            1  
288000000          0 0
          ssp1_sel                        0            0  
288000000          0 0
             ssp1_div                     0            0  
288000000          0 0
                ssp1                      0            0  
288000000          0 0
          ssp0_sel                        1            1  
288000000          0 0
             ssp0_div                     1            1   
57600000          0 0
                ssp0                      1            1   
57600000          0 0
       ref_io1                            0            0  
288000000          0 0
          ssp3_sel                        0            0  
288000000          0 0
             ssp3_div                     0            0  
288000000          0 0
                ssp3                      0            0  
288000000          0 0
       ref_emi                            1            1  
411428571          0 0
          emi_pll                         1            1  
205714286          0 0
             emi_sel                      1            1  
205714286          0 0
                emi                       1            1  
205714286          0 0
       ref_cpu                            1            1  
454736842          0 0
          cpu_pll                         1            1  
454736842          0 0
             cpu                          2            2  
454736842          0 0
                hbus                      4            4  
151578948          0 0
                   fec                    2            2  
151578948          0 0

3) limit ref_io to 288 MHz (= always bit errors on ssp2)

   clock                         enable_cnt  prepare_cnt        rate  
accuracy   phase
----------------------------------------------------------------------------------------
 ref_xtal                                 5            5   
24000000          0 0
    can1                                  0            0   
24000000          0 0
    can0                                  0            0   
24000000          0 0
    uart                                  2            3   
24000000          0 0
    pwm                                   0            0   
24000000          0 0
    rtc                                   0            0      
31250          0 0
    clk32k_div                            1            1      
32000          0 0
       clk32k                             1            1      
32000          0 0
          lradc                           1            1       
2000          0 0
    emi_xtal                              0            0   
24000000          0 0
    xbus                                  3            3   
24000000          0 0
    cpu_xtal                              0            0   
24000000          0 0
    ptp_sel                               0            0   
24000000          0 0
       ptp                                0            0   
24000000          0 0
    lcdif_sel                             0            0   
24000000          0 0
       lcdif_div                          0            0   
24000000          0 0
          lcdif                           0            0   
24000000          0 0
    etm_sel                               0            0   
24000000          0 0
       etm_div                            0            0   
24000000          0 0
          etm                             0            0   
24000000          0 0
    gpmi_sel                              0            0   
24000000          0 0
       gpmi_div                           0            0   
24000000          0 0
          gpmi                            0            0   
24000000          0 0
    pll2                                  1            1   
50000000          0 0
       enet_out                           1            1   
50000000          0 0
    pll1                                  0            0  
480000000          0 0
       usb1_phy                           0            0  
480000000          0 0
          usb1                            0            0  
480000000          0 0
    pll0                                  5            5  
480000000          0 0
       usb0_phy                           2            2  
480000000          0 0
          usb0                            1            1  
480000000          0 0
       spdif_div                          0            0  
120000000          0 0
          spdif                           0            0  
120000000          0 0
       saif1_sel                          0            0  
480000000          0 0
          saif1_div                       0            0       
7324          0 0
             saif1                        0            0       
7324          0 0
       saif0_sel                          0            0  
480000000          0 0
          saif0_div                       0            0       
7324          0 0
             saif0                        0            0       
7324          0 0
       ref_gpmi                           0            0  
480000000          0 0
       ref_hsadc                          0            0  
480000000          0 0
       ref_pix                            0            0  
480000000          0 0
       ref_io0                            1            1  
288000000          0 0
          ssp1_sel                        0            0  
288000000          0 0
             ssp1_div                     0            0  
288000000          0 0
                ssp1                      0            0  
288000000          0 0
          ssp0_sel                        1            1  
288000000          0 0
             ssp0_div                     1            1   
57600000          0 0
                ssp0                      1            1   
57600000          0 0
       ref_io1                            1            1  
288000000          0 0
          ssp3_sel                        0            0  
288000000          0 0
             ssp3_div                     0            0  
288000000          0 0
                ssp3                      0            0  
288000000          0 0
          ssp2_sel                        1            1  
288000000          0 0
             ssp2_div                     1            1  
144000000          0 0
                ssp2                      1            1  
144000000          0 0
       ref_emi                            1            1  
411428571          0 0
          emi_pll                         1            1  
205714286          0 0
             emi_sel                      1            1  
205714286          0 0
                emi                       1            1  
205714286          0 0
       ref_cpu                            1            1  
454736842          0 0
          cpu_pll                         1            1  
454736842          0 0
             cpu                          2            2  
454736842          0 0
                hbus                      4            4  
151578948          0 0
                   fec                    2            2  
151578948          0 0

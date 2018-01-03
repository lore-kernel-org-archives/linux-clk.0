Return-Path: <anischal@codeaurora.org>
Subject: Re: [PATCH v2 0/2] clk: qcom: MISC RCG changes for SDM845
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1514877987-8082-1-git-send-email-anischal@codeaurora.org>
 <20180102181306.GF7997@codeaurora.org>
From: "Nischal, Amit" <anischal@codeaurora.org>
Message-ID: <56647bd2-a046-f6aa-ed27-1d806240f7a0@codeaurora.org>
Date: Wed, 3 Jan 2018 20:14:00 +0530
MIME-Version: 1.0
In-Reply-To: <20180102181306.GF7997@codeaurora.org>
Content-Type: multipart/alternative;
 boundary="------------1EA751EED075CFD0C53F6E73"
List-ID: <linux-clk.vger.kernel.org>

This is a multi-part message in MIME format.
--------------1EA751EED075CFD0C53F6E73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/2/2018 11:43 PM, Stephen Boyd wrote:
> On 01/02, Amit Nischal wrote:
>> Changes in v2:
>> * Changed usage of clk_hw_is_prepared() to __clk_is_enabled()
>>    in clk_rcg2_shared_ops to fix build test error.
> Please change it to read the hardware directly and not use
> __clk_is_enabled() or clk_hw_is_prepared().
>
Hi Stephen,

Thanks for the review the change.

Here intention is to know the software status of the RCG instead of
HW status and we have intentionally not defined the 'is_enabled'
ops for clk_rcg2_shared_ops. This clk_rcg2_shared_ops are only
applicable for the RCGs with shared branches across different
subsystems. Reason for using the same is mentioned below.

When RCG gets enabled by other subsystem (outside the Application
processor subsystem):
   In this case when RCG gets enabled by branch clock managed by
   other subsystem(outside the Application processor subsystem)
   and if we check HW statusof RCG in clk_rcg2_shared_set_rate()
   instead of checking its software statusthen it will give the
   status as ENABLED without overlying software knowingits status
   and during source switch, update configuration will get fail as
   newparent will be indisabled state.

   In above scenario, clock framework will not enable the new
   parent beforeconfiguration update as enable and prepare counts
   are zero for RCG clockand clk_set_rate() will follow below path.

   clk_rcg2_shared_set_rate()
   __clk_set_parent_before()-->New parent will be disabled as prepare 
count = 0
   clk_change_rate()
   clk_set_rate()

So solution of this problem is as follows and same is explained in the
commit text of https://patchwork.kernel.org/patch/10139985/
1. If software status of the RCG is disabled(enable/prepare counts are 0)
    then just cache or store the rate in current_freq variable and if
    softwarestatus is enabled then follow the normal update procedure.

2. Set the rate and switch to new source onlyin clk_rcg2_shared_enable()
    i.e. during RCG enable sequence. This will make surethat required
    parents are already in enable state before configuration updateand
    RCG switch will happen successfully every time.

In past, We have encountered similar RCG update configuration failure issues
for somedisplay RCGs, where there are two branch clocks, one is 
controlled by
application processor subsystem and another one controlled by 
othersubsystem.
So to handle such cases, we need clk_rcg2_shared_ops.

--------------1EA751EED075CFD0C53F6E73
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 1/2/2018 11:43 PM, Stephen Boyd
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180102181306.GF7997@codeaurora.org">
      <pre wrap="">On 01/02, Amit Nischal wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Changes in v2:
* Changed usage of clk_hw_is_prepared() to __clk_is_enabled()
  in clk_rcg2_shared_ops to fix build test error.
</pre>
      </blockquote>
      <pre wrap="">
Please change it to read the hardware directly and not use
__clk_is_enabled() or clk_hw_is_prepared().

</pre>
    </blockquote>
    <tt>Hi Stephen,</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Thanks for the review the change.</tt><tt><br>
      <br>
    </tt><tt>Here intention is to know the software status of the RCG
      instead of</tt><tt><br>
    </tt><tt>HW status and we have intentionally not defined the
      'is_enabled'</tt><tt><br>
    </tt><tt>ops for clk_rcg2_shared_ops. This </tt><tt><tt>clk_rcg2_shared_ops
        are only<br>
        applicable for the RCGs with shared branches across different<br>
        subsystems. </tt>Reason for using the </tt><tt>same is
      mentioned below.</tt><tt><br>
    </tt><tt><br>
    </tt><tt>When RCG gets enabled by other subsystem (outside the
      Application</tt><tt><br>
    </tt><tt>processor subsystem):</tt><tt><br>
    </tt><tt>  In this case when RCG gets enabled by branch clock
      managed by<br>
        other subsystem</tt><tt> </tt><tt>(outside the Application
      processor subsystem)<br>
        and if we check HW status</tt><tt> </tt><tt>of RCG in
      clk_rcg2_shared_set_rate()<br>
        instead of checking its software status</tt><tt> </tt><tt>then
      it will give the<br>
        status as ENABLED without overlying software knowing</tt><tt> </tt><tt>its
      status<br>
        and during source switch, update configuration will get fail as<br>
        new</tt><tt> </tt><tt>parent will be in</tt><tt> </tt><tt>disabled
      state.</tt><tt><br>
    </tt><tt>   </tt><tt><br>
    </tt><tt>  In above scenario, clock framework will not enable the
      new<br>
        parent before</tt><tt> </tt><tt>configuration update as enable
      and prepare counts<br>
        are zero for RCG clock</tt><tt> </tt><tt>and clk_set_rate()
      will follow below path.</tt><tt><br>
    </tt><tt>   </tt><tt><br>
    </tt><tt>  clk_rcg2_shared_set_rate()</tt><tt><br>
    </tt><tt>  __clk_set_parent_before()--&gt;New parent will be
      disabled as prepare count = 0</tt><tt><br>
    </tt><tt>  clk_change_rate()</tt><tt><br>
    </tt><tt>  clk_set_rate()</tt><tt><br>
    </tt><tt><br>
    </tt><tt>So solution of this problem is as follows and same is
      explained in the<br>
      commit text of <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/10139985/">https://patchwork.kernel.org/patch/10139985/</a> <br>
    </tt><tt>1. If software status of the RCG is disabled(enable/prepare
      counts are 0)</tt><tt><br>
    </tt><tt>   then just cache or store the rate in current_freq
      variable and if<br>
         software</tt><tt> </tt><tt>status is enabled then follow the
      normal update procedure.</tt><tt><br>
    </tt><tt>   </tt><tt><br>
    </tt><tt>2. Set the rate and switch to new source only</tt><tt> </tt><tt>in
      clk_rcg2_shared_enable()<br>
         i.e. during RCG enable sequence. This will make sure</tt><tt> </tt><tt>that
      required<br>
         parents are already in enable state before configuration update</tt><tt>
    </tt><tt>and<br>
         RCG switch will happen successfully every time.</tt><tt><br>
       </tt><tt><br>
    </tt><tt>In past, We have encountered similar RCG update
      configuration failure issues</tt><tt><br>
    </tt><tt>for so</tt><tt>me</tt><tt> display RCGs, where there are
      two branch clocks, one is controlled by</tt><tt><br>
    </tt><tt>application processor subsystem and another one controlled
      by other</tt><tt> </tt><tt>subsystem.</tt><tt><br>
    </tt><tt>So to handle such cases, we need </tt><tt>clk_rcg2_shared_ops.</tt><font
      size="-1"><br>
    </font>
  </body>
</html>

--------------1EA751EED075CFD0C53F6E73--

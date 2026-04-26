Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D118871F
	for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777227651; cv=none; b=p2Yn+hX92Qyrx+Qly0UXRdB1i0r7qBVd4R1JiHnWG7KHPKs0PqX/2+pjZeC4bD+zERP9FLjJFt7bcWL/LQHPFrMLLcTBYvUnUOQAkblIj3eGbMHIXh2ZcZKaw9Tq+HuMRJRuU38RB9S+NLubcVCBOrfi4wUgLpmviloLi39CaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777227651; c=relaxed/simple;
	bh=ahTX9XKoQns5RNrN3Do2qgPRo6wxyR4wnbD/BAj5Bg8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Apj3VeNJCEIRn/ghfvbxBXEH8MwscGOHMKvsffFP2qPkP4h/FAAz3IkAxVsLAUNQ8aDhAuaU5hHvBXsXgLQduCFKYgAkYLyvCezb4Qxht25xK4PdFtwQSfr9gjWolE0RNi8yweChSbaPxG8LHsnxnQu5Qers9cgumbMr3ExL8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+31/xag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNHdJ9zk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+31/xag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNHdJ9zk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QI8XcT976095
	for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 18:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09hh0AQEjAGkytrlXes3qCT27+Ck2/x2dOYFX1I7g84=; b=Q+31/xagukr62OL2
	z6sOOnbepaxrdX0pkhSRrFtWsYVEQbPlnLUdXOoRwFeHMU755fYwQKnxrWBeOHaW
	9TwC91/SVkVCtzImShbNazn/dEwE0/EdOmxWTjlCz/tl0Yx8LnvLwYKT0kU+e59a
	x1pTVCG2vzEc2kKjy5fgRycRiovYw+CVvq3O2jD8aDVf32xA+bysy8+4GfZ+EWdF
	ciKK0pbtpxsmx8slWxOZtmNkeRaI/8NkS5ZALQEqhK8Pdxh42rc2q0clcrZVrcXb
	KSNn9ytnWmDom4xzTEivoiGILqrzL7IT0Cbqr+HXYODci6Dkv9vQWPUwXb+ro1XU
	H14unA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4us99x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 18:20:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50eb8bad331so26161521cf.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777227648; x=1777832448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=09hh0AQEjAGkytrlXes3qCT27+Ck2/x2dOYFX1I7g84=;
        b=NNHdJ9zkCUlXAS1vnlSJfqEGme8DG/04bBKJ5VaekUI87gXcW00gcUUsgEz1UXfhfV
         KwO0agkt4Erg7orSzbH56ZTYu5Lbi5tGnCg8dho6AbgD/O6sSeHPZMtj4t61L0rDunmt
         M804Bpqb7+AYVtIHeUjGOWC1dOVgcWBlDIMlTq2ABcESfTluuT1nS5rvQA6Uv9tF5TyS
         SjHXWrphXX0Hl3XuaWqkZeOxkJEAXh2M/h1ShLKPCQcc2EvyZFdiG3b0ph3iZihmMTx/
         1HP6uYoqyXZEhLZ/V3hYiMd4IGPgwpyP9rk3mL4PQa8BWaqO1EvI6VpHSAOhjtLY9450
         E7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777227648; x=1777832448;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09hh0AQEjAGkytrlXes3qCT27+Ck2/x2dOYFX1I7g84=;
        b=eKdDL2A8xcKT4NxlPylxQR7CFEYd9N/4pd/OdK7ORpXCjDvxQkVbeoANyTkyA4uRg3
         qrtWRRJs5M/FOpLmWyGdm9df8WTtc3oyNZDGBk0u2l+9j+8oN99hDE6j4sU0N858Jxvn
         uUlj4wX9csFJHpVkGE+w4ZGjA1Ejhg8fqORbMGNcv9Ypm0/ahEYM0kx0Re/oEXBiBTLd
         7s1N8yVykbVfR2l96SmXy5rltVT4HeDwg3Cdc3kCX5O1iP3Oj8HGLQA5gRFf1wMmAfR8
         1Z2lQ7U1RF9u17lwcB1LlMFVN+FEAa3M+3soXV/g+rBkvkyu/s6TBRUXChAWpF+BUzWv
         76Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+poYcxybeXqE12GowVq51iC2JpL9Y7fy+rjqKbZ/vAiYT1oG8HBEP4RMKkpCO5RgcGE8fA8XLYxc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8W3ZMokJrBxNxuQGnnvtEoBdZs6/L9SVxFVtDLWvUgWEHsg0q
	66lXuOiY3M+PEzRAH09BLlm14DhZWDgcEx5xWOq71ttNqTy7I8dBvTpcx3GskfcCyemc3G5AiH6
	i3BZuhOvXN/J4iB8iFnp1Af5StzDZpwUoA26iAHTR9a8PQ4YqVcmrdgWe0xxVdMU=
X-Gm-Gg: AeBDieurpIGIhXHidht4pd1ReIZRXVhxqU2UvjlnYg5szWdzm5eK87GylETLpDFurWm
	XIpSGpS9rRecIBdyp9gj4HQm+jcbU7vRckikTpcmz/DwvOCD2xtGf1mrlSU/cA7rlsXRX4S0UU+
	gMIsrPm41jb6rLuoclw7E1SLAg5rO2RKHRTRQV0v4wZX57h6QIPtVV8f5V91d/UqsqThVxwiRLK
	fnQOBXRNkmqwKNNkH/H2gRu5wypQA2NaL8uiNBVRHeFsl+fn2PrR65g7pYAThQ2KajtGsAI1zg3
	PANnZzGQpI5ROwhKeamz/QN0FP8xvi35aSey/ewQrOsE+6hQWRMHje9xANtb8QKJqSjqY6q4V/R
	Xu1Le22shyYjcXM4LwxxlMQ/BGWsyCCHJ/IixkkJWguKnHauiJx3XvWW62H4bzd9eugZWaQe8A5
	o16MIMZq99ZrvN9g3YCZbFxNrRy26ajVBxtFNkZKg1b5H3dPq+One8fc3rwEOKoY8YZJvMG+oUv
	eGh4ROIDPSSLI07ZTA5o9oKSA8=
X-Received: by 2002:a05:622a:14c:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50e36c4021emr617420071cf.40.1777227648113;
        Sun, 26 Apr 2026 11:20:48 -0700 (PDT)
X-Received: by 2002:a05:622a:14c:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50e36c4021emr617419661cf.40.1777227647648;
        Sun, 26 Apr 2026 11:20:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121042esm988652166b.13.2026.04.26.11.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 11:20:46 -0700 (PDT)
Message-ID: <6290f555-3945-4c4e-83bc-31907e0d1ec6@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 20:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
 <39679013-dacd-4804-a52f-0c36adf8e698@packett.cool>
Content-Language: en-US, nl
In-Reply-To: <39679013-dacd-4804-a52f-0c36adf8e698@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jNe4eWujlnrmuvJwNiRG9gM_fx7qyEAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDIwMyBTYWx0ZWRfX2zq6FCMXbqGY
 17YLUbxRHSDKbNfiYW5J/IDb4zxfgc7sOaA+MDbtb5/7OV5DNx4HjGYIQe6JYY4WCzSmUEBTdgB
 4ehr5+f1ax/kB24y44jRjUWpVT5rUECU00ZTnmbXzIjqdVLwsgH/30gjaC79rZC3JfKg/7oQrgE
 lqzs/GcwKABtNqfsL2vrKSR+X8gUKaUH5RKRWhn9jbxB71HnQZPdOVWgQ9PeQkxU0njNS5UIj9z
 DtijhQUryU0PSDmUO/yvhUajCihf2jQbiMqjOy3lmRjlj4W/Sfhx6vdytLjzBph6DbInnhLSb+3
 Wt9TN/f7+hyYeUOA/d1XppRSlPllSJaqb4SVuElloLdzD2L2/MjL6IIkJPR7ig6hPcBQQzbbbTW
 OViLnOhIbx5ilueMWuwlDufQ2+z+kmFc+DOc8uc6/y+01a8Un9sSHfVV1Cnc8I0FW7NkECao3sN
 8Zp1KMjA+1xyNoRP4cQ==
X-Proofpoint-ORIG-GUID: jNe4eWujlnrmuvJwNiRG9gM_fx7qyEAP
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ee5781 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=OrraVpBg1U_QHr0clLoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_06,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260203

Hi Val,

On 25-Apr-26 18:10, Val Packett wrote:
> 
> On 4/25/26 9:44 AM, Dmitry Baryshkov wrote:
>> On Sat, 25 Apr 2026 at 15:33, Hans de Goede
>> <johannes.goede@oss.qualcomm.com> wrote:
>>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>>> to stop functioning. The EFI GOP framebuffer should keep working until
>>> the msm display driver loads, to help with boot debugging and to ensure
>>> display output when the msm module is not in the initramfs.
>>>
>>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>>
>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Thanks for finding this!!
>> Most likely we need this to be performed for all dispcc drivers. At
>> least for all laptop usecases.
> 
> This is relevant for phones (ex-Android) as well actually, though there have been attempts to fix that by adding stuff like
> 
>             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>                  <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                  <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>                  <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>                  <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>                  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>             power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
> 
> to the simple-framebuffer node. However there have also been some "random" issues with the handover to mdss drivers (even with the mdss reset) so some postmarketOS kernel builds completely disable the simplefb driver.

Interesting. Note that just adding the clocks does not fully fix
the parking issue. The clock gets parked as soon as the dispcc-x1e80100
driver binds and the simpledrm driver binds later, so the clock will
still get parked for at least a while, leading at best to a display
glitch and as worse to the hw being in a confused state.

We do still need these clocks to have a chance for things to work
without needing clk_ignore_unused.

I've been having quite a bit of trouble with getting a
simple-framebuffer with similar clocks listed to work on a Snapdragon
X1E78100 based ThinkPad T14s too work.

The problem is that every other boot or so once the msm driver
loads the display goes black with the following errors:

[    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
[    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100, CPU#8: kworker/8:1/138

I've tried putting a delay between the simpledrm driver turning
off the clocks and the msm driver loading but that does not help.

My conclusion is that the current simple-framebuffer resource
handling code concept/design is broken. The intention of listing the
resources in the simple-framebuffer DT node is to avoid them getting
turned off, IOW leave them untouched.

The turning them on at bind time of the driver is a no-op since all
of them are already on and we also don't need to worry about
power-sequencing because of the resources already being on.

But on unbind of the simpledrm driver / removal of the sysfb
platform-device we actually do start touching resources and
turning them off causing these problems (and not knowing
anything about the correct power-off sequence).

So as said I believe the current design is broken, on unbind any
usage counters like struct clk_core enable and prepare count
should be decremented to allow the e.g. clk to turn off later;
but at this point in time the hw-state should not be touched,
so that the actual display driver inherits the hw in the exact
state as setup by the firmware/bootloader.

A first approach to stop simpledrm from turning off the clocks
just before the msm driver loads is here:

https://github.com/jwrdegoede/linux-sunxi/commits/efifb-simplefb-resources-wip

and then specifically the last 2 commits, which switch
to setting the CLK_IGNORE_UNUSED flag on the clocks
instead of doing clk_prepare_enable() on probe() followed
by a problematic clk_disable_unprepare() on remove()

This works for my case and likely for more Qualcomm hw, but
as the Self NACK in the commit messages explains:

This will not work some other device/driver uses a clock with
the same parent and then runtime-suspends.

Because we don't increment the enable account, so the parent
will then get disabled on the runtime-suspend of the other
consumer.

Instead I'm thinking about adding a clk_decrement_disable_unprepare_count()
function which goes through all the normal clk_disable_unprepare() motions
except for actually calling the clock-driver's disable() and unprepare()
callbacks (for both the clock itself and its parents).

I'll probably give that a shot tomorrow.

Or since just setting CLK_IGNORE_UNUSED works for qcom (no shared
parents, or at least none with runtime suspending other consumers?),
just patch dispcc-x1e80100.c

Regards,

Hans



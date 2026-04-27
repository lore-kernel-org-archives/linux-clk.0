Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696961F192E
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305612; cv=none; b=menru8wkA+qsw2rnPb1T99h1dFvEGngzlcjWzUX56EogJTKHvPPWEj5txxuEp3faHagVqXExiKSX6983PEAvr3la+RglY5hG6bJg2+KugY8ulURU2APPBnxoEdlH7hx5m/nZB2irGQ73RxE4LgbOmiD7a4HyT3PnJKrFIdwhoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305612; c=relaxed/simple;
	bh=xA7oLw0PVHyFtLsv+xJ6J7jiDBNJ8vCSViifsyVMwXg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=datvfUphCgvjHMlrCyA8lXRya9Y29csV9cXp0zCFoxDghtxHHI7msxc3k8udgCsgrsggj1CzK6lgLqp+DqSB6bZQrf+UihMmF75bxF3pd9XhlDPs+Ez3Jo8OhZo7Gn7XvlBighYo160R0+shsFrNaVtx26Db9DrA1DyyxtuUXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKVQ2OQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESCvUtSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKVQ2OQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESCvUtSw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLOde440971
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 16:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5YnZZPvlhd3x4Gktd+oBlK9waA9ib5xr0OuakVMGMQ=; b=PKVQ2OQmoqFs0Tp9
	rRylN1a7twVqktNfcdbfCM0PGQmySefZQCz+pzdswhCTSkdwN9v9IPpdTUv1gRx8
	rza4VqGYjWzX00qy5Kh/+5RFP1lfRrBRLBXd5pE5iz6RbbxAdAD/tGT4oKBJOho0
	NoNNg+zO5nEEoyN53y5ERu64xmI/dlicXjQa8ubMFmCNCLnS6AtlLA4LN3RAGVbF
	C1MDkPklH6Dt8prsBYeQgqdoYUVdsKp2O7DVAw2b4gKr3HoM2lqztkkLJuUWBj07
	Hmc/Z7rnYQRmgyov5MSf9eDs0VPMxAmdDMSwVaRI2mFvPMd+ofVMY+rUaWdn7bjd
	fzmEbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac404e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 16:00:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fcdd579e1so80222671cf.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777305609; x=1777910409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w5YnZZPvlhd3x4Gktd+oBlK9waA9ib5xr0OuakVMGMQ=;
        b=ESCvUtSwh4hJ0zrE6Hk7IXwIZV8LZCk3yvt0I/PKcCW1bAkPzCtXMF+s4FQRoPU28I
         sjL0JwcUtrqSmFeXjMEjSRPxSt8NUOL0DVFlVjPzi1UfoWGgyAdP3bQ2mpTkAr0YckfK
         tdKalq0k3gNSm3B8zeYBaJwjx4asjnytTbyrnKrr3ZCBklr56WdN5WQmuJRho1YmL3OT
         DQG+e4hcljqoVvH16vTYEJ5pZ0ADERcEa9E/cR5FBcBzM9mAch+siuOegcqnBUBwg/P0
         rcqRCrtVDj0Vb+pi3YFOP1PertuQEx/SEmxamDnCT0Gy23G7hBLsxbI1QEQAhYYOJGAW
         VGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305609; x=1777910409;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5YnZZPvlhd3x4Gktd+oBlK9waA9ib5xr0OuakVMGMQ=;
        b=I+k24gJSdZQpZHB0BwGBlSnzmyTS4PxCWAuK7C//e6z2QSahXoDPB9QFau85PIh7pA
         2kalmhbI4L+VJDx+CBKqtCPZ3oam1FNdwMMqrW/j3hK54ehEirlu+Q+jhWZbY8Jf/i5x
         jjjT2d0ce4cR/Zn6ueTpjve96v/Ug+p+ZFU/dEWDtvxwdi5d5r2xJL1yGITWRX1/GMf9
         4OzPGtC5JGxMNcsc+mdhybKJ5jxg4yVbOjHpQ8sXUm0YT8APatq5Xh580WdZEd+Evj/P
         /+eoutMp1fQsM1mnPqt0fRVOjOQhY8BhKfGmYnhVW8tvdQrkufag4TuZrn8XwbMkme0Q
         XlPQ==
X-Forwarded-Encrypted: i=1; AFNElJ94n5t309xkmkXSn2YZJDGPaZBXUI2ewetL0nZNeq1QRotdHlguFe1KGcuQyx2+iLT27T3pvAZ2rU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvECe5KSAAzxjbtpStx0U+OBcSZE2k764DOKCEjCWcigxU4svF
	1SQGGgEF6FadSdZb1Gq7rEWqm8iivBZ6no8hlzuOo4vvOe5K97eYq0invsDrAV+Eo9x0n5pd8B7
	aVFFlCkfFA0Os8cAvu3Ghza+4gIW+QhVCrdwglrcAf0tz1Q4/S7ucf3uTy0O9eMU=
X-Gm-Gg: AeBDieu6Tj50D/lKNfGCPeune1bz5iSv7POzHUDmxQsyyzOq4TejwCCMtfBBLYxmJiI
	M7+C4AfeTEVMJwDMjl9Li/bPCOCD2SLrWAGjQVphEeSazPTXCSKgOrUHYxIcnwrQI2+G5o3FvMQ
	W0/kzpoPcFV52708ONns83h/IaHoRcFv9w8qS0ZMNqQk/eTkCKnY9LnjYB3V33o1r5YX07QlMBx
	+ljeGBycRqbAY9mUO/nKb3q9uww9/CPjHnMd9tWlbRXrFx4LJIjT7fakc20SJnJe+9lUUbQwwlU
	vVf1p8jSEAc4cNBsY12DRxPak9/VnzMmXWHze/Y1gOWAHIPBsSD9FCr6fo1P6+nDl5mRgMTtuFj
	OaHh9QRs2zzA0o2sL79oAQiTke4rkSR7pvLbgXQcDIjbGmEd1sVciwoV65V4bvUesEFrbQoeSyV
	elWjwC5Oebav1o/4PrmVKLEAfJifbYlZ6Md1JdavYTt+Wmt04TZbACeQ7w8coE+3cdY4MSGPWmY
	0nNaaWKXqGUqROma/iJ16TthSc=
X-Received: by 2002:a05:622a:1e9b:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50e36c124d0mr687660441cf.30.1777305608425;
        Mon, 27 Apr 2026 09:00:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1e9b:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50e36c124d0mr687659071cf.30.1777305607655;
        Mon, 27 Apr 2026 09:00:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533b79sm1142735966b.54.2026.04.27.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:00:06 -0700 (PDT)
Message-ID: <0b7bc494-d463-42e8-966b-7201ae7495e2@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 18:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
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
 <6290f555-3945-4c4e-83bc-31907e0d1ec6@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <6290f555-3945-4c4e-83bc-31907e0d1ec6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 99e-Ruk8CawfSO_RHqgUKXeVGhktQ1jW
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69ef880a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=yU1tb2PetugIyephoyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 99e-Ruk8CawfSO_RHqgUKXeVGhktQ1jW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE3MCBTYWx0ZWRfX7xbT2VtIakFe
 Q5OD4FVtYfB/UceUG4e6LX6vafBw9rrVhrF84bZubLJtW6ntq/NHg286Q7z5j6HlAewdD1jDKm3
 uXe7a1g5zUGWfkZrRoB5rAjaACXz5VBX08GL4lSSSk3NXfalu1W+p4PM74PNChwkwAh5GClNu5m
 HlAt6bIFkPUQiDWWNGtCNUTlzOCrseoVCsYxzKaeEJCpEFprgLt3JuB2OF47xqsBhtb6PO1x29P
 Lr5LlWeQ0ox9oCLZ4t7IUP9d2zNVWpXfR4GkIog6y84Wxv0dv5ThRaXV8Y0FnLXtQfFJ/dRq+I/
 TXQvhVqsczj+wIp86zqbicBSCa3xXIRGahx1r4lW4oqVyiEJrQ1sEnioY1KeQfH9yJRbzdXnztr
 aUInRWqkIrPrZFJkiOPI232uDGuuFLJDne8TCpB+UQ09Q8+W3htcXlf4v5RvPAe6d0qnyw+4V6L
 iMiOACg7U4GhcDOoXcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270170

Hi,

On 26-Apr-26 20:20, Hans de Goede wrote:
> Hi Val,
> 
> On 25-Apr-26 18:10, Val Packett wrote:
>>
>> On 4/25/26 9:44 AM, Dmitry Baryshkov wrote:
>>> On Sat, 25 Apr 2026 at 15:33, Hans de Goede
>>> <johannes.goede@oss.qualcomm.com> wrote:
>>>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>>>> to stop functioning. The EFI GOP framebuffer should keep working until
>>>> the msm display driver loads, to help with boot debugging and to ensure
>>>> display output when the msm module is not in the initramfs.
>>>>
>>>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>>>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Thanks for finding this!!
>>> Most likely we need this to be performed for all dispcc drivers. At
>>> least for all laptop usecases.
>>
>> This is relevant for phones (ex-Android) as well actually, though there have been attempts to fix that by adding stuff like
>>
>>             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>>                  <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>                  <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>>                  <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>>                  <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>>                  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>             power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
>>
>> to the simple-framebuffer node. However there have also been some "random" issues with the handover to mdss drivers (even with the mdss reset) so some postmarketOS kernel builds completely disable the simplefb driver.
> 
> Interesting. Note that just adding the clocks does not fully fix
> the parking issue. The clock gets parked as soon as the dispcc-x1e80100
> driver binds and the simpledrm driver binds later, so the clock will
> still get parked for at least a while, leading at best to a display
> glitch and as worse to the hw being in a confused state.
> 
> We do still need these clocks to have a chance for things to work
> without needing clk_ignore_unused.
> 
> I've been having quite a bit of trouble with getting a
> simple-framebuffer with similar clocks listed to work on a Snapdragon
> X1E78100 based ThinkPad T14s too work.
> 
> The problem is that every other boot or so once the msm driver
> loads the display goes black with the following errors:
> 
> [    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
> [    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100, CPU#8: kworker/8:1/138
> 
> I've tried putting a delay between the simpledrm driver turning
> off the clocks and the msm driver loading but that does not help.
> 
> My conclusion is that the current simple-framebuffer resource
> handling code concept/design is broken. The intention of listing the
> resources in the simple-framebuffer DT node is to avoid them getting
> turned off, IOW leave them untouched.
> 
> The turning them on at bind time of the driver is a no-op since all
> of them are already on and we also don't need to worry about
> power-sequencing because of the resources already being on.
> 
> But on unbind of the simpledrm driver / removal of the sysfb
> platform-device we actually do start touching resources and
> turning them off causing these problems (and not knowing
> anything about the correct power-off sequence).
> 
> So as said I believe the current design is broken, on unbind any
> usage counters like struct clk_core enable and prepare count
> should be decremented to allow the e.g. clk to turn off later;
> but at this point in time the hw-state should not be touched,
> so that the actual display driver inherits the hw in the exact
> state as setup by the firmware/bootloader.
> 
> A first approach to stop simpledrm from turning off the clocks
> just before the msm driver loads is here:
> 
> https://github.com/jwrdegoede/linux-sunxi/commits/efifb-simplefb-resources-wip
> 
> and then specifically the last 2 commits, which switch
> to setting the CLK_IGNORE_UNUSED flag on the clocks
> instead of doing clk_prepare_enable() on probe() followed
> by a problematic clk_disable_unprepare() on remove()
> 
> This works for my case and likely for more Qualcomm hw, but
> as the Self NACK in the commit messages explains:
> 
> This will not work some other device/driver uses a clock with
> the same parent and then runtime-suspends.
> 
> Because we don't increment the enable account, so the parent
> will then get disabled on the runtime-suspend of the other
> consumer.
> 
> Instead I'm thinking about adding a clk_decrement_disable_unprepare_count()
> function which goes through all the normal clk_disable_unprepare() motions
> except for actually calling the clock-driver's disable() and unprepare()
> callbacks (for both the clock itself and its parents).
> 
> I'll probably give that a shot tomorrow.

I've implemented this solution now and this seems to work nicely, see:

https://github.com/jwrdegoede/linux-sunxi/commits/efifb-simplefb-resources-wip-v2

Regards,

Hans



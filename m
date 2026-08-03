Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6713A05C2
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741261; cv=none; b=Zev/TNawVrc4YTUvz3lmowhlKHMUiz+1CBoY8uoJ5dmG1s/fGVKhkbiOI9cVop00iMlRjQ8Er5ROBZG25lBDpKsk58VygMSkBzoaEgc3wjo/Cw6HEPrWGHwRu1YbZ9MJ5Y+Viucz4U11C+lDYVDlmYdh2wmoeGv9uCEw08PIP3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741261; c=relaxed/simple;
	bh=pl59Mynf1Har5nfHFNGB2fnpDOeCr2qMuf76HPWNGjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9kP1I4HE7dYnAnkL1W7El1SEyxo4fG/hlIHmVSa3upVIEJgrUXLhfIpZn9P1A3+dRUELESHwbJC9LJDqxTBR7okjglutXfsTSyMHDRG1DFFK0R8A+ek6O74otbZcPvHNRiCHLl7lfyjU+2th7yHFHz77C3BwjJ4jyAXOf8CbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRADpaPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY+N93OT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRADpaPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY+N93OT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SC58250196
	for <linux-clk@vger.kernel.org>; Mon, 3 Aug 2026 07:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vxEOBWwcQ1gPMY31104ohoxWNiwHBRZHzCPyJUjfPg=; b=QRADpaPysiHpZkPp
	KvSYoCd/7vS3NIjZ9ipYAVV6SVn3d0IVArXMXU5yxTKyWQZznzrNlDzfZBnEXZzt
	t2V5mlk33BEx44k292ZM7BdKAkx0QhzTvCUgLDkFF55F4eoUCrL8b/AZUTw6J5Qk
	iLKTnpNeGJoH2yWiMGfwhD92BlSR81CLVjYi6IVL5VgYqZs5m6bnApVZkgaLyJkm
	2qY27Nq4lHknfO3CX6wq6Knd1E9QGU3NUu4IqEP+rr0ZzdWG75qaQRGXF2xOyqr8
	/39xxaX+u7twJTrf0vMMixastzEvPVSAaqfsCUs5UCIlp3kktwETb65c/+hBa8cW
	WPWe6g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd85q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:14:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso4718787b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785741257; x=1786346057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vxEOBWwcQ1gPMY31104ohoxWNiwHBRZHzCPyJUjfPg=;
        b=TY+N93OTWG/TdQrxFcAGC7jMfAERsc7nEAkhfGOkXrx2G07eDL998P4y0Kxttxf7U8
         RaCcoO9JB1URATBbuwaGMxfiB5PrhgGcuncDUC+Z9kqaJV3fZ55eUbnYfjGl/ABX3RRb
         uSjtM3tBiIrrcgX9ua5kNdM09PvLwby5SLcspsBHpVZKIQ/0f1W7UYkJTbh9FBPnKDHX
         PWtmucuDxkY+YTZRLUe3dRBJ50KSb7dmu08DCIiffIjdHorkwxhcMu9jNDvfaFRdziYe
         nf8GPi2GitO4+RsgJ7ff8D4GQTLkSclxY4npaX3lZ1iGBM2rit3H55TbQxPp4m3R2WhE
         Zq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741257; x=1786346057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vxEOBWwcQ1gPMY31104ohoxWNiwHBRZHzCPyJUjfPg=;
        b=eAr3BZqKuH+B3/3jPKcIP8yCTSZtFMAAhmbLtacCHPxBpfUOUr2Q+NNJkJXNVN/tbT
         0V5XKnn9gaRKc4s9if6W+X0U6c/AxIIwNLc/jPEDiou+X4mbqT0NR5PP51OaM9YATGjJ
         fZmhs1F4lSrXb9uD0j88PnUOofevywt9OWUpf8XaGYezsjUZdL57Pdwd4f/enbVyMXjG
         Uz4dEhGzTabTolIvSNrLG23FRnCj3Zl/+am7Ilvude1n1Rl6cIDO2emUQuD/hYi3gpta
         i72OP1UFSGNtsDfsPhj5NB8w80QkpkjSicAwlmFQQw5UNf1fRrdoM6FJ7ZB9RCaQxxsw
         bb2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwwEQDcQjzdYdMNYx/uMNMDOKCZG6Xffz/9to8Q08Cl1IKqL+yjIRL/aSd/O9a7OVdoO222pkZAVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdQry1AG+5XTQdjAV/QUWQGuNnzXt8G0I2O6s9LG2Q3F/sRyg
	14qBN7C3dtc8yoI2fk3CpaRXhTWdBDHdKKRJJfQtTUiUzBP/kPWjwgPF9cb4kjjTjnFWzAd9lSr
	17ZadNT9DQTx5yZ9AIbPemhtavex1GbEh9vDckIkto82dO6NccqFZK2CE0P+64do=
X-Gm-Gg: AR+sD10oB0wqeo2vjggJF55Uz1fUnJAwwnLP6A3BTTdRE3PzK28eJdWfMoKnvymYpQB
	MSZcetD96zNfU9kBKhvT5aAn6eUPDShRYZgH6FNlDDKPt1PiO9Bu39OQGC+sNPXxJEfE7BSfLxw
	nmgXFnzim16gfGdB+uPqnO9J72V0MKvUFGuMysm2Bg+heYpY6XDNiGxIjr7mooaLB/0Ju6yhYem
	nB3CvGzmb2U0fO55UfIGkF/wyzOLp9X6ZK/oS2naxEenwvLTGG9m3G+k2xGsYT7wq673gsCjdz+
	1VMsb2Hroz/8Rc2nWoqOGH6X0/qhpSn3TozDg4X1VBnIkmlTCma45iaPGuhManvooNW/EgFlxwu
	cbtgPKEaGGbV7TiSEzyaOxlFyYahlZjEVR2L/1NHHwJSixjAQJyk6XkxzE8hlS7+LWQ==
X-Received: by 2002:a05:6a00:2381:b0:848:6dd5:f69 with SMTP id d2e1a72fcca58-84ee48a4d02mr8210500b3a.42.1785741257247;
        Mon, 03 Aug 2026 00:14:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2381:b0:848:6dd5:f69 with SMTP id d2e1a72fcca58-84ee48a4d02mr8210479b3a.42.1785741256832;
        Mon, 03 Aug 2026 00:14:16 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d6dd3sm3283510b3a.46.2026.08.03.00.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 00:14:16 -0700 (PDT)
Message-ID: <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:14:11 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        devnull+george.moussalem.outlook.com@kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260730191353.557494-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2MiBTYWx0ZWRfX5jzVbLXPzn8k
 L3WFaNHXbDcmr+bDrCttet6boQPcCZfSsrk/Cb7XAtBNqdQpuXqFFPzLMynYO+dd0IYsJ2KOPdC
 AwhrJ/bgXIyFbyEW3+2lvJaDXHEx5L4=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a703fc9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7_mjQ7ShsriNIxc-HisA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: WUuTReWEVZtd0ATgUizHFx-pJQrac6Xk
X-Proofpoint-ORIG-GUID: WUuTReWEVZtd0ATgUizHFx-pJQrac6Xk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2MiBTYWx0ZWRfXzMNuEQeIdvnF
 c74Y8s74RAeL9d6YFx6kl4/2LKLFtgRthaKlanRrXmnXN54pVYUYoHK9+uzro+uK6iR1reXl9Ts
 LPsplCg99kxLdLZT/e1s5WLxJpMPCbiwRW1tG5EaOBozAFqD9rli/uNemtCEnj/HtO0MHccK3FH
 VCDBwunUp3tkHBhA8tGmw5WXca5/x4I7GmI6OB9wflGh7eZm2lX1wImJ7fEvKc7uWLTaexmaPDj
 28srHYk3HtRMW/fzJ4iWSguk0XLz6f344x45l3csUlw8+tDMzK3YWwHAJf+IhCFampsjKHmZOfb
 vNMz+zOjghwZQNiBz8ihVZyEScIfL3AXplmnmxPIW+sUw8jcEJVUOo/2cmDS2FsZtBJBQ76hxpr
 Vy44PbhwXPhTLhRPx5QoUMcOpNze6EWM93trquyChw22kOcOFM48x2fEp/DLp9RP2FugBOi7ymc
 iz59uurClFsfLRB+d/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030062



On 7/31/2026 3:13 AM, Stanislaw Pal wrote:
> The probe function takes a runtime PM reference to enable the GCC AHB &
> SYS clocks of the CMN PLL block, registers the clocks, and then drops
> the reference. Once the autosuspend kicks in, pm_clk gates both clocks
> a few milliseconds after probe has returned.
> 
> That is wrong on two counts:
> 
>   - The clock ops access the CMN PLL registers without taking a runtime
>     PM reference of their own, so any later clk_set_rate() or rate
>     recalculation touches the register file with its bus clock gated.

clk_cmn_pll_set_rate() is invoked as part of the AHB and SYS clock
enable sequence. The CMN PLL clock rate is configured according to the
DTS assigned-clock-rates-u64 property, which is applied when
devm_of_clk_add_hw_provider() (called inside
ipq_cmn_pll_register_clks()) triggers the call chain:

of_clk_add_hw_provider() → of_clk_set_defaults()

This corresponds to the following DTS entries:
assigned-clocks = <&cmn_pll IPQ5018_CMN_PLL_CLK>;
assigned-clock-rates-u64 = /bits/ 64 <4800000000>;

> 
>   - On IPQ5018 the consequences are not contained to this device:
>     gating the CMN block bus clocks makes the SoC hang on a subsequent
>     bus access. Measured on a TP-Link Archer AX55 v1 (IPQ5018), the
>     machine dies silently within a few milliseconds of the CMN PLL
>     probe returning - mid-character on the UART - and the victim is
>     whichever device happens to probe next. Whether a given boot
>     survives the window is a micro-timing lottery: different binary
>     layouts of the same kernel ranged from occasional failures to a
>     100% reproducible boot loop.
> 
> Keep the runtime PM usage count elevated on the probe success path, so
> the bus clocks stay enabled. With this one change the same board went
> from boot-looping to surviving every boot attempt (verified across
> three previously-failing kernel binaries, plus repeated soft and hard
> resets on the final one).

The CMN PLL AHB/SYS clocks will remain enabled as long as a downstream
consumer of the CMN PLL clocks is active — this behaviour was confirmed
experimentally on the IPQ9574 platform as example.

# insmod ipq-cmn-pll.ko
#
# devmem 0x9b780
0x00000000
#
# insmod nsscc-ipq9574.ko
# devmem 0x9b780
0x000000FF
#

> 
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
> ---
> One more observation from the same debugging session, for the people
> who know this silicon: on IPQ5018 the CMN_PLL_LOCKED bit (offset 0x64,
> bit 8) never asserts. Every clk_cmn_pll_set_rate() call runs its
> regmap_read_poll_timeout() to the full 100 ms timeout - including under
> the bootloader-programmed configuration the hardware demonstrably runs
> fine with - and nobody notices, because clk_change_rate() ignores the
> .set_rate return value, so the -ETIMEDOUT is swallowed silently. Is the
> lock status readable at a different offset on this SoC, or is the bit
> simply not functional there? Happy to send a follow-up (surfacing the
> error, or skipping the poll where it cannot work) once someone can say
> what the intended behavior is.

The CMN_PLL_LOCKED bit offset and behavior are consistent across all IPQ
platforms — the same register layout applies to IPQ5018.

> 
>  drivers/clk/qcom/ipq-cmn-pll.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -454,11 +454,19 @@
>  
>  	/* Register CMN PLL clock and fixed rate output clocks. */
>  	ret = ipq_cmn_pll_register_clks(pdev);
> -	pm_runtime_put(dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put(dev);
>  		return dev_err_probe(dev, ret,
>  				     "Failed to register CMN PLL clocks\n");
> +	}
>  
> +	/*
> +	 * Keep the runtime PM usage count elevated on the success path, so
> +	 * the CMN block AHB & SYS clocks stay enabled: the clock ops access
> +	 * the CMN PLL registers without taking a runtime PM reference, and
> +	 * on IPQ5018 gating these clocks after probe hangs the SoC on a
> +	 * subsequent bus access.
> +	 */
>  	return 0;
>  }
>  
> 


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D573115A2
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983638; cv=none; b=iDPFObfrgRBGu9iUGiyh3REPiwAk+F0iF3NTLX8rFfpaiGUigQ8VhQ+xhZEPYgv64KCN+wMeQlSWnhL39ovTnBmSvn4oCFWMgt1of/IKhVhBBYu1ZY0pHkD5foZyBYGad6wVQ3irbokvLhelvxU94Zgokc/mMGwrGFbU3t4Lc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983638; c=relaxed/simple;
	bh=2wL/0sSCB8XRvjz+WEbz5GumTqFVHg8AKU0xDFwZDJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2SuIE+wCX8Mhw7rqGpDb5lke2yfohonximcwkCwr4Jd+NbkZsKh5A8poqv8EZjaaj+yOoKuTE5z7VJlz+OKPdnzS8IeipJcp7rB1hbvcuWFXZoBodtwEMTVTFnR1QqtjLQW8B7d/6RsH/DXRxJ//c1DA8luQmbjn20NtNvrvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lficjhk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYscw93C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lficjhk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYscw93C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nate2731300
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 02:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7gA3+FBd/Fa+TLRPi+gpOlfzf1Fw20xB2BKEV1S6LE=; b=lficjhk4ZKEj50cx
	09fDKpfIWDhqvrimM9G6cAfVjUYFopILHbFLb1sDEUESJKftDZVWf6ksvMYoN+E/
	xFmIWvU+mqk2D1Ro1AzI73Sj26KAFosWPdCZ7u+I0zQJl3wl3uoaSw2cgsFfztjX
	7ipcg+3801RD7gnN6QOoUugambDN26tp0Wy0TSia3o58QpSfKmOf5mPbgTRNYNJY
	PbJT5NfZ0TYgxBM+4p7jAd3AOWdGwmS03DocxkiRldO9fdwcxXVEhonXXR1xPxqn
	5jeZlkM4V9u0CaLEU1shb76WsIxbly4gCeivHWl0mGrxcVENWL7TfLLIlJBosHOL
	WFnF3Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk36m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 02:33:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84857446424so2864119b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 19:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785983636; x=1786588436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7gA3+FBd/Fa+TLRPi+gpOlfzf1Fw20xB2BKEV1S6LE=;
        b=IYscw93CG/LZe2t/8itp+w6EUIZU2UfbPRqRZaQRzFz/qsEPC6l+OpyggEi3+3x2A/
         o14Gt/+KzwFICk7eBq3dQmrE6IzklTbsLo5UqUlzEiBrNBf7UU51lW8DXNFhF8nNX8XA
         mJJoKsuxRvVIPrdZ0saY+VAtUCdgFDu1xEUonurw4Dhgjdxwjj1JSvSgFT4fx17HM7B0
         1TfRtd/aSM9g9iN08Q1PUUULAWn8TFeIJZ4P7xMK+u+qEoceCT6a16on6SR4K1PP2pm1
         hG1ZnFGkIXl+oq6/xMvyrY6M3yEfBcTMGfyDl7HBIcM28lWfv+leAIlq/2lsuWr8myWX
         Kt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785983636; x=1786588436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7gA3+FBd/Fa+TLRPi+gpOlfzf1Fw20xB2BKEV1S6LE=;
        b=HZInLs4y5xalrLexbhVBC4NHoQxv8OqEIv0C4G/wwsEeNBk3xkuLtGtmNGKIMLLP9/
         ENyo1gxGaXAo2k2ozQCXs0jVPJjPukVLHz3nnr2XmB0to3rsb3Uq8TJpq5sUgvxVT57h
         8fGRFGSk1d3MXNL5Yb5cwH0+IRa5Pjf7xnAo3A8+MW2IgNHWZqvtsS+96M4IeCoP4224
         fZuE87SbeYgIFB8T3dc+JL4b4ajWp565UGXAnM3LM0sgwa1b8wZ6gVP242cLKlXRUk0R
         5FjrsbIsbE7GYsgpN+Kd3URNuFt6sWoRjNRpQGn1JXkz8P32nSUwk5hHYUqwVUAqh0GO
         uPRg==
X-Forwarded-Encrypted: i=1; AHgh+RrDWcLrckrM3UDn6JodbCA2DJMC/vkt9OmLnewdMsNudxcCkGtAOgjQB7i4X0hW2utBeQX9yXmi5Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3NSf84qSV4Jc5ZgVmgY9qo6ocRhtqHIF8ZCDsy8g6bWFc21I
	3b6TF+JwZr6JW3rF83Xceia2LV5k2lIi7lFWB13Ord8DgSpO/On8JSygTxKeqZAcreGP7M3K4g9
	nvwKLJAuff9RTbyvgDuSuQsLREbjArhhmNCXOS+dsqHoK/GM7hbNiI1iauSUKVks4aZuSs0c=
X-Gm-Gg: AR+sD13dtadDHlQAe3bz/iEZ4KIp6FZ/FmBN6zYv1aHIWql2OCVMknBISQ2XjsP4mV4
	RDFSMiBt3SU+Hf7Yd1tEv87kh5MAOXyZcol8/GFe26R0p9heW0v1BuGHXKefZBbTfFKbP5AI2Ps
	hCOQGIFzNkRBXPPAn3lrcn0xI/98bA1R0rsZOZHSdv/j3iTJln6tv3K5Ry54nMfUCBcsH5M1XLn
	+Zfw+1orGJodrio+gK8OV4flwHWZITZMtlbtkfGXbbH+ERLjz3OiG+N5Kx5hmFRxUqv75a7kk1V
	EBlVWM4MaXwxciuhI3kJChfnWI+temPbhi3yIh7tnX1oNRc8FEAKOTTdztg/nquxIyxZ3WQEtA5
	Ni/MJLjAq4nWZgiT/IDAx2ln5NSrsFK3xMZFnpee1ZCXY3jB6XaMuAkuFtdlirBlFeQ==
X-Received: by 2002:a05:6a00:148d:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-84f2e0caa1fmr12861031b3a.34.1785983635929;
        Wed, 05 Aug 2026 19:33:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:148d:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-84f2e0caa1fmr12860965b3a.34.1785983635277;
        Wed, 05 Aug 2026 19:33:55 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9c55sm322131b3a.54.2026.08.05.19.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 19:33:54 -0700 (PDT)
Message-ID: <7913cc81-5531-42ac-a85c-fb873e439a07@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:33:50 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <1dc44e5e-7787-47f7-938f-1ac0676d96d2@oss.qualcomm.com>
 <20260805081240.11497-1-kuncy7@gmail.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260805081240.11497-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ckNysACL98XAEoE1IE7Xjy_uqN0MYftU
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a73f294 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wM4_PVCd8tWBAy5hSusA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAxNyBTYWx0ZWRfX6RihFu5/6410
 ezxh9+DKkOAE5Wqk3KthHJKaGR16qZQpqcGajG+wH2gr4AkodFa/e6WYF7M1skPw6ETmX9ItbYe
 SDLkyo9UXPjLkCBlsbXKbQ5eRa2YcO6qG47zeTnJvlnFD5uGE9I/W8GOy33PM78zXmPM+EHboFJ
 XerXCD01PKzRFaubTCef1H78mGnXoqbJs9lQoXR42OQft/gYoaej9rwAszppHCmCFmR++Yzunup
 fckrW571gaiPCFnkeOToQfUBHfI9DTzE9wsD1d3bsaZ7KMwkv/5i678461D3+w0OZGWjcYDIHF2
 LMMF2rZsYXHn8upc3M3Ev1soGIeO3w7qt04qNRPBpJUDbD/BOxcjlFuUhhIHNPbbBcpgjxtoeZe
 EOd4A35Pmk9TUyNO6/VnhfeMlQE6Z5xassPhkm6pfmO96ahJX77klnuCaPGnV9xBonNZIfnaLex
 5hSRQYzZkR/SFJjPE9w==
X-Proofpoint-GUID: ckNysACL98XAEoE1IE7Xjy_uqN0MYftU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAxNyBTYWx0ZWRfX8DipeGVzPmsB
 FR/IXAhymUXKRbZo1FlcmtNsRKRR8kGYyTxZwIjxFz9XsiflPHVV1pCKvrvIsc9rR7xj6OQXpu9
 xXYHCuXap696yTNR8muzLPOWc+3Gu1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060017



On 8/5/2026 4:12 PM, Stanislaw Pal wrote:
> On 8/5/2026 Jie Luo wrote:
>> Is there any use case that requires accessing the CMN PLL registers when
>> no downstream consumer is active? If not, I don't think a fix is needed
>> here. As you may have observed, debugfs clk_summary can still display
>> the clock rate correctly even when there is no downstream consumer and
>> the AHB and SYS clocks are disabled.
> 
> The clk_summary observation does not show what it seems to show, and I
> have to correct my own previous mail on the same point: this driver does
> not set CLK_GET_RATE_NOCACHE, and clk_core_get_rate_recalc() only calls
> .recalc_rate for clocks that have that flag. So clk_summary (and
> clk_get_rate()) return the rate cached at registration time, when probe
> still held the bus clocks enabled - no register access happens at all.
> It displaying correct rates with the clocks gated is exactly the cached
> value; it says nothing about whether an actual access would survive.
> 
> As for the use case: on IPQ5018 it is booting the SoC. With the clocks
> gated after probe, boards hang within milliseconds - 100% reproducible
> on some builds, before userspace exists, with no consumer anywhere - and
> the only variable that changes the outcome is holding this reference.
> That is also why I do not think moving runtime PM references into the
> clk ops would help this platform: by your own argument nothing calls the
> ops at that point, yet the SoC still dies. Whatever the fatal access is
> - a CCF path we have not pinned down, or something else in the same
> clock domain - the platform demonstrably does not survive the gate
> itself.

Once the CMN PLL module has been loaded, there should be no further need
to access its registers during normal operation. The CMN PLL provides
fixed-rate clocks, and its output clocks should be initialized and
operating at the correct fixed rates after the module is loaded for the
IPQ5018 platform.

Regarding the hang issue you mentioned, it should not be related to the
inability to access the CMN PLL registers. The actual root cause of the
hang should be investigated separately.

> 
> One more general point: the CCF gives no guarantee that clk API calls
> only happen while some consumer device is runtime-active. The DT device
> link keeps the supplier active while the consumer *device* is active,
> but a consumer is free to call clk_set_rate()/clk_round_rate() at any
> time, including while itself runtime-suspended - and on IPQ5018 there is
> no link at all. So "registers are only accessed while a consumer is
> active" is not an invariant anything enforces; it just happens to hold
> on the platforms where the DT wiring exists.
> 
> If there is an alternative fix you would prefer - a different clock
> handoff from the bootloader state, describing the in-silicon consumers
> in DT, anything else - I am happy to test it on this hardware. But as it
> stands, a mainline kernel cannot boot reliably on IPQ5018 without this
> change, which is why I believe a fix is needed and Cc'd stable.
> 
> Thanks,
> Stanislaw


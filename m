Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DABB531AFC
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961059; cv=none; b=tCr23NY4s1SBpkKT/2HsdYLs6Dta5p9HTQw5MsMFsbkPnDfWmem2eCzYfRu5bEiS1hbZltEdG0CZmGBjxhSOlNk7oCgrQf0FIinga4qo+1/pE7mhq40p1grqbbGvFX03W6aT8rG9FC4zt/lW4n8fDxdA+YTnIydCEUqbM/I/z9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961059; c=relaxed/simple;
	bh=O7CTYYww6kbvbIlbWW7DJQj/nWqn1Zl5VNdZA+L0TkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPqRAjyDFQDCq8G7pIlzx1aRs1Wy0L0zRiFzQuPX4IEoTClxvMSQhXyJMvTZNrCXA1mPAmXZVxmTXy9t9Gpzg3Ua5GxgIZCxz40QkoxxHzBc95yRAO8d5vV4juq5N2zrkiYwIQg5+Dl/ZhCqAfCFC2h1Z1+hOL0R7L2xO67baR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEIvFy+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddUXav12; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEIvFy+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddUXav12"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4Dq1723123
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 13:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=; b=hEIvFy+hGRl7UivC
	xvoY1NvSocAfvPTKn4kBVjpF00Z8wJRPupUSQWiGz8ScOW9BGZMRhiMDZp51p+2n
	Quiaf3dlVWvo29BI6iZIVHARai+8W82J0sbLJLJcfCN1z5Z3TpZT+vaQTxkBLSBD
	7eQndcMbdFpUYyIU8+CxccwVY8ml9nMCR9q+2yJi7TkRsmF2EjKzbLKm3DZgYSqq
	aD8Dzu+RYfvUIMgIs5OP55YkGCwDXNsoy37UMsmy/XdquisOs2onEXa+KKKkhRki
	se5nqvJQkr0c4svBQWiCsqfkZAzGPRF6LT0RsWVwkSrH4nRt1MUD1ttgFM8SuiNZ
	go/HNA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrthm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 13:37:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so176217e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788961056; x=1789565856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=;
        b=ddUXav12elXcIY/krpmJ2PxoSQwDeP4qRMpgdfwUr0/UE5h24EhnkRrOFS7vIyIcH0
         Bd50eJvBdLroH66nhtLi73IUy99bqemelk/HvzlypL+kPypxUczaBOzh1mNrjDeIR6uq
         7Y6nemDB/n/VzxJRftuPtD5wGXtp8iRZH+NIg9mkgz2BPJm+6mc4VgeazEPJlfF7lyR0
         Lzca9vGvNuOodJF2kurIu1c4L5c9ti8YU/so93iebUnEBKWB1bC+82hgljbDD5h5jdvX
         NqC45hdHE4x9bgV0ysYVFxjlYIfuWvynDwtdK3jOhJa65VosvlyZt97JNTkQHF1h/N3L
         XJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961056; x=1789565856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=;
        b=iCQcGw/W7EQHVigEsp3fa/ldH8h7WkPVe/MmAWALw0V0oQcQkhJie4wwkUyf/07vVO
         KfxeiJHRRFLqYHlb2cuXnyO2+Yv3WHYLnaD6ycBGb5jBRDaw/+6pH29lR/WCk2BEEvbf
         UnoZi5P32jM0mkmmRa0Rn6lJndHp9vr+nUaVSJR2WRYytpNrD3zU9ke1tIbMKQfdPJRk
         zysW+/5H3q5nv4J3s9aFJPbFR42NWLTM3UxYux26pJgdD/sCqTeJfgDHxpSiwTCKJvMD
         xxy3Ep6qZZNjM9vUMW4qZ8JiRFHqcgklf+F1JyRCFxv2ZkTpAKPWX+6kkCmRCyhy+wUI
         dZLg==
X-Forwarded-Encrypted: i=1; AKwUvBwnXdy9E+/2J5yTHWxK4J/fDZFQzNJJ74wpWpfxPUfX94HsYqfnbNfQK9YOW0BZfFT1XokLp5M6oJk=@vger.kernel.org
X-Gm-Message-State: AFuF++kS4fBfchkjtiTnt+o4XE4fGnDCKGLYQ127xhwtKSzazDIeyJkt
	0rYQthAGAeqspsRysLgu3afmqagzL+JKEUfb4OXnfZDeMzu1zzkeyAuknrUI1rRhwKiQXje1XyR
	mdA80COtPH0oAYwqsNEQxB0gh+wERZrRiUoG4Vur/DMgmHTOm6/fS+DiDlsYwYqE=
X-Gm-Gg: AYBFou1UHDsBO+Vt/11ekAThNH+IdzWDu/FQUsfDUU2GlbR8viIYH0f30SdneUrufu0
	GP0S8vQZ+ep1GwIKo00/glWhcwCUu4icbYm6D9XmDOpxCF1wn/qa8vtdD2UY9SsIdCs4kCROBMR
	8tw1eFsl9Y+7MrD6yu+CKoxWxf7FOHWOF3XhzrSZs+VGK1BXuBQaNsyEqe8nYubRPsLnRpyCbTs
	IkharLIaXlyQsu/Fv3PE5bvNatGI9x+EBF6R6cg4/dS3AkDkduW5zxJSs2gOqJsQtUaCOBWHIXE
	bo4PtaS/JGOTSepa6bcSpi8ax2FrkOn3KvMZK4tCZtgMtgHFIqeF5bJRwpJ0xG0WIchPC5s/WCp
	Ahc0LqYYhct/pI9nLeo+0UA==
X-Received: by 2002:a05:6122:6b14:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8148141a8mr3923754e0c.1.1788961056439;
        Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
X-Received: by 2002:a05:6122:6b14:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8148141a8mr3923741e0c.1.1788961056058;
        Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b7673bd6e5sm438764e87.22.2026.09.09.06.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:37:35 -0700 (PDT)
Message-ID: <fcd7eb6b-95ab-43eb-91f7-f9a0ffe18ead@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:37:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Jie Luo <jie.luo@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Georg Seema <georgseema@gmail.com>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
 <20260909132049.37611-1-kuncy7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909132049.37611-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7a_w0o3F4aTG1zbs15B1gsysg0tDgBf1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX6pdtru8Bu1KU
 xGW/vDGT8/3emBK0r0Nt1l3HLtOWQAkxkgOpzLqA3rd3BB6ERiAxDY/UBG5LNWoskrkU1GeGZ2W
 NTHiQWifq5s0NVthWAvErf+ULqrDlOo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX5ufOQk0tAFr0
 qHk1lOIjhCIWi/4Q3uWOVeQylIFQEkUCmtH+APXYzCwKWWwIaI3WS4AKviDnzDuKT/8RRZpdfP7
 NaGxYzWTRMOAQKZXX42Gd7ZVNOduoScUALs1tj2ASkd/lJQ9sji1w9jPHx+VHqSeNCZSJGMu//C
 HNKMVBSzrPAlnygN6gFuMEnK5h+PYiiKY1d71We7xRwO53YPNHvkCPkkzHQd2S2Wy39rSO3S0w5
 22CtEQz6Q8MQLFdfbPQrINuEtF5CvetfkA/CRpJK7VdfY+qIEsVwznNoa79z0IsciG42r+5O4nZ
 y7f4DdiCWIPR9k6xEVHUGrzk8PiLJKppY9nTX/RXUOX0B/2GfDkCDbVWM71LR36Cmg5r5D/dHuR
 JBNA0ASHD03OCGvS0lB1t+h/QN9t8Qoknvh//YpcMLrmJew5JPbzFEXK31rcQo8xwx/ljNxpUfT
 35d/Mum7lMAOwIsZGLQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa16121 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=oVlbBDgyKwfZh0hzoKgA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 7a_w0o3F4aTG1zbs15B1gsysg0tDgBf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090152

On 9/9/26 3:20 PM, Stanislaw Pal wrote:
> On 9/9/26 2:12 PM, Konrad Dybcio wrote:
>> Is it only the UNIPHY consuming the 50 MHz one?
>>
>> What consumes the XO clock? What consumes the sleep clock?
> 
> Nothing in Linux consumes any of the three today.

Yes, that's more than clear :)

I'm trying to ask Jie about the platform details, to which I
unfortunately don't have access at the moment..

or maybe +Kathiravan?

[...]


> I would rather this did not decide the patch, though, because the
> failure it fixes is not a later register access to the CMN block.
> Mieczyslaw's summary in the v4 thread put it that way; the mechanism I
> measured is narrower, and it is what the v4 commit message describes:
> 
>  - gating those same two clocks on an idle, fully booted GL-B3000
>    (runtime PM autosuspend, gate landing ~75 s after probe) is
>    harmless - runtime_status "suspended", both radios still serving
>    clients;
>  - with UNIPHY0 disabled in the device tree, so that no uniphy driver
>    exists in that boot at all, the board still dies in 6 of 7 boots;
>  - stretching the end of probe by 15 ms, or by a full 2 s, still ends
>    in a watchdog reset, 8 of 8 boots each.
> 
> So what hangs the SoC is the gate transition landing amid early-boot
> bus activity, not any consumer's access afterwards.

I would be more inclined to believe it's racing against some other
driver enabling/disabling something else, perhaps a register that
depends on a clock derived from these two.

When that crash occurs does the device enter crashdump mode (USB
PID 0x900e)?

Konrad

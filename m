Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407472;
	b=As14d2pPxSQCgPpt9XJYK12bvGKoBJvS6hRJeHdwe4+4pGxjtFoYv0ivIo9ljxZKwSOV
	 jtGFGT5qhNurIGkZGEfwzacI5mCY+2qq2+K4K3eAa+tDBng+/1DdWdOK4NEye83L/aDwH
	 9K179uJHkDGj5xyFjoqnh08AjH6OyY5fCCsI9P0k7cecV9gjU+erE0wnZggoR+5DBBj3t
	 W6OvfIeIB4OaWPLjAMEfwZMZTH1Z6POaA5pfjZKlP9OQqzYaogdsRSZiKNuougaN8MHer
	 fikJlVhO0VM7KrTxwSjWejhZmd8pVZne9AckrjVEIQzwKhlF1KtJ96026CTTet5ypVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
	b=pIU0yfEgQP81xEvQbkHs6oBvjOduqQjtOdRe7C02JIlXB1Qj8r5AWdBg4AtO29FfMjp+
	 pmgiBlPNNw0x/4NOZ3vGeO6JbPocHw4y8f4GPGr6zj4g9uLtLdw3f2NV73DRfis3nsR4b
	 mPqF0kNNX3Xog4hQT3LkUB0b92h3ItjVlhWbWpfqFPdXZwLn3RG3vy1HMpWRBG4ah4I2I
	 UpioSgbCvEm/Is4iA3qc4elg0RFKdCqF2ryb9WJZ9XVQHyCMi9xpGYGuY2O2C+XLo6IHX
	 XwuY4eY+5p5j/fuFijhgHAKHAemyj8Nk3s5qojMfsuKBQx2Et/YGfkk6+EWlegN0xkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGjO7NAW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VIxJnEaE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64C606A32E
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A64C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGjO7NAW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VIxJnEaE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHdEw2501538
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EN+WAVgkwiDEL7XX6X4DT1Vg
	Y5ErtLa0IoCAAHBwQOI=; b=MGjO7NAWXsm5REpaJFCiUmZCvAi9qTiRnAr8Kq86
	AVPhiEtdmyqSoNbuDeMZlrhyVPlwHdQAdjWSC+w9sxdD7esdjBb8iM1bPgZWC8qZ
	hyjrDjJVLrnGpupUahioTlrJm9CkKvSwOhRVsDYYk2ecMmZsNbQ3tevH1BOfUKmO
	IMzeMp1QY8UESmTdYHXn2R7qdjiZjNMrXcPM4Rx6BA+809hJRgU4W7tmp8A4MU9z
	ayKtNV+SPc6XcLi0Wh0Xs4pfN3bYImTHy/kGNYC/PpcCxmmyeZjZqvuF+dgxIAAA
	iwKPNE0pNrhqTGseDWxKfD5+B5q7ADtHGjfIcadDTeLbdA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9jrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:31:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99081ea787eso2089257241.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 06:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407469; x=1795012269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
        b=VIxJnEaEtRUwmyyvvJyDebsCikKyVT73tjXPmY0O2EfAC22DDgSBroTKvWVbu4KQm7
         wCksiIt6GTyGAIHFSTlR+Ou3ktRG22J1Pq8y5xitRg/MymFgTm0Bbn/+bs8QSg98T+tv
         yJoUxwu9Fpy6ZbrHkDQUg9ZBoTXZN/VmV2Ky7WVsVohJyMzqltVGKbVVnh9d2Wafi83l
         u2M5X2V5j5+opbbfzykfpAAJ2QF4Uapyh8hpVeznSknZPVEcN9E3NEBrwSW12Qqr8Hk+
         18TcHMHST5skMYTWmbZIh0fMI3dktFayVvI0WED51lQO9nEkqYg1wupft+I2M+WGKvAl
         GvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407469; x=1795012269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
        b=kCqCf1k1gkSXpNgygWxuj7tqWHidn/h6B+Us09pHh8gNw3r9qDiI1XCP7/6o9qt73m
         pH/hmUfrUiqBN4obxo3pQ99tol9tmW1xs1OTaPovEO2C8sdW/aebTJGkcl0OX9PQv8mh
         lmm+zVB85CboAzsdfXfztP/avl9SNDi9lmhYE+qH0HCN2GmCn37jcRSvHBnD6mi3Z0p+
         bRhVSX7tmTnjbVn5zm5qekyHkBJMf9YwuJiyIvbxF5b3UuhdEXa/MFn4QFeWjPTRq3Km
         pDl4/Ivft4zcm/htO1Ck9Ap+ZxRcMeZebFtfE53cbg+bsRi+V8zwfBO1MgYRj7nVgIAc
         D4BA==
X-Forwarded-Encrypted: i=1; AL+hErGK5Wpkxt4DxbhEkwuZ7oj2QOOM2Y1FyfIo7Zs/guYZ5gM6GMPaTjV/JL1IjY0Lyx0ep9C76jkalyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vQz8SHj06deeFbFe0j+by3cKM8bENbir7v7IHadYc97tKClRh
	ThVH1saHyQN8EGq6tJ7yQIBWlThhOu4+3BKTHsa0M009ELItN7/IZUSZ7YuPXnHVboxkh8fNaSY
	Y6iw/Q5CdFNr3AAwYVV39aa4U5Rtm+KClk0/9amQREguqilNvSGajDcT2EGh4ucA=
X-Gm-Gg: AYBFou0NMe+fsI68Axwg6FNtun7WDXsXafpmape0OM4shyiaLLzPadak7DAKftcETYJ
	GdmdFfvsMFtSIxIR4a2Ko7LMzkZXg5YLcrSZJHx3iaSNeP2dkVbF6RCxAte+CuA6dx3oWvOpm6T
	HiWWjrRmCeiaxt6IuEXi4Ycr4d/YMBOhH9mIIQQu9hFAcY3odffyqKaGMzXtT0pByy+FI5xxVo5
	l8Xu5Jtq7umXBNeH/tx6HBSy5aapnnxAKmKLM3laRvqjWfIFLQvzSdFFI0nkTyn5JfUFYs2CsN1
	ZJv39X25NfjThIciQ8+IL2YATGXBAMFEbXNb397lEtReP61z3HuAsU1/PlwRuiWZvHBH/6jBOra
	AnS9meAUF/v+trd9i60cQKmdgNY/ukH8mS0DddtuL+OtmGhzXrhrg2ZgNxIN0yRtq
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee1c3ff521mr824893e0c.9.1794407469399;
        Wed, 11 Nov 2026 06:31:09 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee1c3ff521mr824825e0c.9.1794407468682;
        Wed, 11 Nov 2026 06:31:08 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e57504sm54594105e9.2.2026.11.11.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:31:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:31:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8750: Use retention for USB power
 domains
Message-ID: <gncowr77bzqv7mnshfpqv5rkvkjeyc5if7zfuf2xtqbxakppi7@xvefvpjdc2et>
References: <20261110213346.1359-1-tvlad744@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110213346.1359-1-tvlad744@gmail.com>
X-Proofpoint-GUID: cA4iuTJiQjhA9I-nmC--HTiioVgJu1nw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX7it0xol/ONek
 M+UuqLXaxw5yBxNqAFvwnswi+25A6D3NYmQLt6dYlBqKrJ/EvjR6RM0Op0wYb/3uv4pEntIeQVA
 EK43eSx1Uoq5Ubgz/wimfzxIvno6v9yjrx+mTcN8aVgEtJ8pebsYg05ebk1QjPe4Qa1qvKayO48
 PIsDnDvGkJduoMhbdU9Aoc4QOV8EIsB5/vUrz/5kk58lhWaiuiNlW0sKgVOMSMXfMkWRl3vHa4l
 9S4mj2a3MPbxwCJRkYWPJyv0JP2UuMR8Co1sCbhRvAu79B7St9HUHqe6aCeSk0nvd+OiTBM+OAb
 CN59Dr/HNPVLrn8VHUTmXgdfooZsNE9DNLH2IrB+kH5x7vIJHl3Bm8wacdG0EVdnF+ReTuUYlHX
 VSsgwZBynhxIzUTfeMw366XxPDOIIwgeZxfXuTky8s+ULM0p5wPvvn1W0hIIzWJ2TNNg5OcUmxZ
 VaHNezAbbp3mSq0xmWg==
X-Proofpoint-ORIG-GUID: cA4iuTJiQjhA9I-nmC--HTiioVgJu1nw
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af47c2e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=F04PIRqRD5HbMnb_lPAA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX9DzcWc5RMi3m
 RSS5UoFqVST7XOa+FXehC37XNyKrgPJdr2HSd2AduM5/YqqQ85cB4SCOlSspPwgec0fRnP0KFjU
 DGnApv6xkzegRJmoFcV1WGiUvN/9aD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-10 23:33:46, Vladyslav Tymoshchuk wrote:
> The USB controller does not expect to lose its state in system suspend.
> The controller node is a wakeup source, so in host mode dwc3 keeps the
> core initialized across suspend, while genpd still powers the USB GDSCs
> off. With a USB stick on the port, the xHCI comes back from s2idle with
> an SMMU fault and is given up:
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
>   xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
>   xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
>   xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
>   xhci-hcd xhci-hcd.3.auto: HC died; cleaning up
> 
> After that the port is dead in device mode as well, until a reboot.
> 
> Keep the controller and PHY GDSCs in retention, as SM8650 and X1E80100
> do.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

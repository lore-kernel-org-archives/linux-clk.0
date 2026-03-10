Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1648538910E
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142964; cv=none; b=dQ/qW0ur1aKVSYunWG9irmEaaW0v9hj9ezMM4VRhZHhSP+AENOE0W7LzaVVWPTtOH4iEgYVAhvawMLUa/exk1lLIYP2UekL/ucnBKFAOv3GcFo43VstHC9CJXkLilaR0RbebWgmEBDTpsFSklB1qo0W60K7IAc93pkUXpZ3X2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142964; c=relaxed/simple;
	bh=nWcFV/TgJjUWyb5YTMgRKEfjE+gwDbAhB7ZBjZjy0OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCOCZHg0yGpu1ATg+ZJ/TZNxaZwM0z5hLZoUBLmOvfbzmaIFcakZ2HGrCVCjNibuOKc+eo9VbWroZYblcHo0zVbc1AurQ4ZF90akyMhSXpv7M1Q96wrcMTy5M7qUJFrg5W+Mh6fllMnq+ChbVqd4BI3TFRdS+TnUUpKzRKLBWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ALmujp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdFGCRxx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3ALmujp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdFGCRxx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h5ZF2754148
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FlROxhILgSAaj5UVC9XFhARrvRruw19l2WOccZt1KlA=; b=V3ALmujpwpcUR1K6
	N7Wu+sbXPFwt1K9M2mqE3PIVUDirWHUYHezgR7RbWat5c/062JfmPqaVJYM15BpE
	1yZofLi1KhJZ187ZqlfLKb65smYNDSv12JQuziALrBVON4O6fJEbLcNX5JOpHThj
	9GOUwS9K5FxfMxEL6QQVXmA7QfdDTftovLru0SCOxyZTFDjYtEe89JuteB3RQuyG
	rIg5BCdHn+U1WobRUjYZekOiaisa7S0wMo9V4ZrS+v3f/1vMbMW3JR4CpKDa8R0R
	tqd/9KG8DzOOZLat1ucj8M+VgF+39e9S5MJGsNEGGR4dqt9TbDDbh4d8WZ5P62Hc
	cSEhjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrpf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 11:42:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8ea43d4eso89610885a.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142961; x=1773747761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlROxhILgSAaj5UVC9XFhARrvRruw19l2WOccZt1KlA=;
        b=CdFGCRxx+BcGT+k4YdiQvv82rT1793M2ngNWvWT+RUCLkDDYMUHxte4t/ga1dpLLKY
         OSOovwcpdWr9yYcE99kOpdjQQHkVGU/VX+iqkpxiwh2c4cm+98Ro9NXXCtlC4XmCJDnM
         Y8LEHiB8UzGcbDkg0FGU6cJNRXRttwjIHF97kD4FZdsTHuV1vl6JzQtWfuWMXhpocECj
         NJiI2otvrkFeXkjElYofskoy26B+b529z8MnvsF+f04nk8qA05BgV6kJ13eY3N2dUu2h
         o/ksKbNJWXFw62ZQo9L7yRJ6g2mhfGV05ckEZz5y1HPk3yOFJsxzOPeI3d6DHRMrYv9s
         irHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142961; x=1773747761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlROxhILgSAaj5UVC9XFhARrvRruw19l2WOccZt1KlA=;
        b=AWhOStIVdGWpuAdGuThQmqrqK1LZMeMmBROUmhZ+wWtex2jmlyvhdpLiZLqeALFX5B
         f/UHFHotg/XoB731c9aVDa5GjbJ48wmQeS1g5FhZzgE0KNWmRKrPXCkqqyr7iHToAKnJ
         gpiB7nJab+es7ydvcIvg3BS6PJkQdIVSrpkq2S/KkOUBEYWc3ZkOopO/IRQNqOI5m/D4
         AcW2xymg330YCKHBO5PkBegEMNErRix96dDaApxdUW1W+Foj8xVuljOVWDjCVNXVltNe
         s3a2pJ2bux98zKzQt/imRP9o7V2qXBBWbcYyDUHdZ9m7hjZEaSlYpm6/ErkocmFuE3D9
         AwRw==
X-Forwarded-Encrypted: i=1; AJvYcCW2wXAHdO9cIRriqC+Nrme9OaGg1kqd8tk+PFjLo8b01Y+s4jSSCvHdMnh0/z/b2WNj4+Gf4j34lA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGBjcpufsxMzeGHwRUATrQ8yaQzScvaFLO4NVGJDHgIp2MF2Yz
	6d0HCn6FnlhyY4DtBTrL8mctUNoQycRfLbP5bhACc84sPvwCfKRbdJlyVn5rpAqEbxVjOIdmNOR
	8icJNDdZj7SM/bCZiw5zLtqFOQxomeEkrQk5s9iHUMtj1R/iEZ9FVLzYiTPvC6hg=
X-Gm-Gg: ATEYQzxGBn2Dc5OiVIIZUaZosP+Cp2fncT9lKfpcBGSS/U2rPbmdrRiP5DHLnKNz1oJ
	XbYw5/QQxexYxH2r9w48g7u7qdl1qaQTyGn+R2CyAicKD6nJobgLLxcwqGHQV2TZ33Tx1/2/XiH
	k5wCnDdtOipyKxqHpKmch04AbQxUaC5djjsZd6siiCsWHqG0gcPEm3eLqo6vLBOH6w56P3P+pLa
	9BoTJUGBffO+icyg86UgDMEgNEwfKdReFVRjvhWVnzoJm68Koly1OlNUajKP4kRWDx+nRNX5UQN
	uh4bsojuL6fAk6Df5s3V0bYAlzR9bBQIk7EjZ5Cw84HAdRJJj9c8+aZyvZ65qLHXAd3dspzDEGv
	GX+CeFT/l7Ldz92uO2fbWmtt2cnL/GhnUGJ+E6pBwAxPwzBCsRzVnJq/8qrEw4PVvXvKl5kdoZw
	jj8NE=
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr621894685a.0.1773142961123;
        Tue, 10 Mar 2026 04:42:41 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr621892185a.0.1773142960709;
        Tue, 10 Mar 2026 04:42:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b6a1sm467184166b.18.2026.03.10.04.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:42:39 -0700 (PDT)
Message-ID: <09fbf867-7d0d-4f8e-94c9-9b3353058f76@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:42:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: sc8180x: PM-related fixes
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b003b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UohXaN_ZemWmdIUgp5IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NHbNZgBTNt_l3xDJDwEXxQCBErZY2Nmb
X-Proofpoint-GUID: NHbNZgBTNt_l3xDJDwEXxQCBErZY2Nmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMSBTYWx0ZWRfXwI7vNfW1Bhik
 NSB3wdubZ82uSspHA/kjD+MNND9p187GPAwRm51ebMk8sDq5K29QfbqA2NJmQ/hSF6F4HEnspl3
 sxxHJ3aUiRKjEpaQaI0YiWpF//JHcdHSbk4ccbd7AdYXUBlpcvvSFwfQLTucmuFmdCXUZBFpOiA
 /slJatQIdlUGpQIoZW1Pb5pKBOVUWrHOS19aPeczaJLYUF9n0bpfLz9cGXha9Pr7mE1iveNpDgm
 KuJInfg8vERSK8iHSqv+zink8+g+rWf4dSTbbclwZnDf2ihXLuN8Kpd2oi9IubsHwGY2UZGd4mk
 pj9QUyhuHvAUgDE2TjHFwBCYniv4xk8aLEAM5ZYqKNTK1r62suRHp/1DXcqTva0icGaZXwPCGsZ
 tWL9240N82UwZZJVKPZJw44zDvxvQg5gzedCXOrweWvR2jN/mhnzaP2Fqa/e25eabng9xAzfvGc
 a0JPcG0EbrEupQyK7Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100101

On 3/9/26 2:00 AM, Val Packett wrote:
> This series mostly ports the fixes that were made over the years to the
> sc8280xp drivers to the sc8180x ones. (With apologies to everyone for
> somewhat stealing the commit messages in places :D)

imitation is the sincerest form of flattery!

> The most pressing issue this resolves is s2idle exit on the Surface Pro X
> being slow and breaking NVMe:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>     usb usb1: root hub lost power or was reset
>     usb usb2: root hub lost power or was reset
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme nvme0: Does your device have a faulty power saving mode enabled?
>     nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
> 
> Hopefully it also contributes towards improving power usage eventually..
> 
> One thing I'm left wondering about is 8d114b94fc39 ("clk: qcom:
> gcc-sc8280xp: use collapse-voting for PCIe GDSCs"), not sure if it
> applies and if it does, where I'd find the values. (Downstream dtsi for
> sdmshrike, which is the closest SoC that the msm kernel supports AFAIK,
> was my only reference and it doesn't seem to have anything related.)

No such thing on this platform

> And 9410fb940114 ("clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe")
> .. we don't have the _src clocks for PCIe defined at all here (o.0)

It'll take some time before they become useful I think, but if you'd like
to add them and boot-test (absolute addresses):

pcie0 0x16b028
pcie1 0x18d028
pcie2 0x19d028
pcie3 0x1a3028

usb_pri 0x10f05c
usb_sec 0x11005c

(all are phymux-like)

Konrad

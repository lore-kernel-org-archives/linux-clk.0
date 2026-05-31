Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754263911C3
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241805; cv=none; b=R3uj37DU2rqI9+Jxlbk6A/LJW3fQxoWYnxYgA+MSubkqqnFmlsJkMOC0FIOMA1VEA292XdnZ3ONui84gTSuRAilpKw7i3CuEiZTtbmzRXAFDMR5+WOCgkhf2zLvKOr1PvBEcz2o5gicQPRor8GujxVCqPycRx0KHwYEn9qP4lx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241805; c=relaxed/simple;
	bh=Vm870xPJE8qvzXWEDH5XaelUxRUQX1IJ86/QGb5EVwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfj8eZSBniqLH2RV+DR3vkqpjxhTu3hgW4ZSwo/7/MrCe1tiTybVXGfQGql+35AiLh0ejaI1AkIbD9+TBJVAbvKWqCMLVAAVIKluSnjY6NnX0/OMdPMCudLDq5dIEYSlCMg/S6oKnSR0t+tly5waZf9HccmWU0uYkA7bfSRT2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjpBGxy2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaTAsEuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjpBGxy2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaTAsEuU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VBTNqF1413774
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 15:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+hMrtd+FJbHgB6523Eb735Z1
	cc+qiHlvfKDZVpjYavk=; b=WjpBGxy2Xj73dHbVnbKFVeKPMq5ZBvQ72iJN0o3e
	DI4l6f15fi56O+F9VAeIeP+E0l3cyJNfIpY6CNg/JWIjnXsMkBM/K+63FzTmyeH4
	PxH2oCXf+JrTd+YzKM7TSd8sXQvfZvGnPq1Sxt6nI094NG0Tx5woebj4JZol5NW2
	W8GV8iKXAu4dU800w9K4OHDobqvcgXlTppIfKgMgPk3mSgEktSUbLP5RwztQ5vyt
	tAJ+oVMVr8qcA3iYK71JD8HOWtR+QTfCPn02FGtuGNxYSISZHz18bFAbqXeYv4Of
	hZxWy5D3sSaT/G7WuOs+jd3MAZMi+qTmns6YWXu8yvkhpQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pmh18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 15:36:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so2327165137.2
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780241800; x=1780846600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hMrtd+FJbHgB6523Eb735Z1cc+qiHlvfKDZVpjYavk=;
        b=jaTAsEuUIDP8R04x00Fw0H+iv16jI0D0eDuCLdSr0P9GC6kvfOyBY52a3EEnOrxEVZ
         N4da/HfSqFYYL1iSKVFDEEuhUJiPAWqawQvNogSc009B2ZIvHFhJxyA9I+9kZQ0Dm26s
         ioUdgPy0W/LhlBxR9kv/pUAFxkI1J9GvgyNYlr2h27as+ojiIv7WJK4CxaMHBJpDW58D
         MvYfbdMiUkE9q0UdvemeVQEFRYCY4C4X+wzBrQEdf9dJrYTMbrfAKBUVxa6Br4902Lai
         3kfzAUFI4CwWxFSSoBjPhVsJV+TUQjVvjDlplmqQGwCsQ1qpMqRdQTITHSUF95mo65F5
         xa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241800; x=1780846600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hMrtd+FJbHgB6523Eb735Z1cc+qiHlvfKDZVpjYavk=;
        b=AtaF7Q2JiMBZfzbc1dx8UWZ9ljvIGAyLRjeI3KzJn0TWEZzgDJP3rg8rJYPO1bMUL6
         hxZOokOKKJjdC0z6PvY/X5d1kSIxTGxWyARBzwGPIcWrr8pCkZ40d1WldfjHJtbW372F
         oUu9G7LAFQuoeUZctGayI0q3XDbkixs3kme3aO0YLOI7XWdHbu6udLPTxCqB5OjkhgZF
         u1/YpDcMkBDn2JIzyawf0a2+q1XJtspGbspSpTpdvkts/MEQQGz2TQNSRguw6AuUW0Za
         hvPLPDpzUQrzCXuKvF6cABVl+hG934gnwwLzi0yr+Za7hSGavj46NE+zfJYHCEfaJbqq
         vhmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8y6XScmYx7vKddaz4TBoK4VjzLm4YBPgQiIhLBlLLy2wTMThUnm92yepibl64WWy207S7On4G/Oqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7G268JD6dFSvw91FKKxPWoMY8tJsPrWfCoJSKJBa0tyUTSmWg
	ZGXflEu3F6AfIt9ZDxfko52HI9sCzBe/oLwwMEzwTyCQbTJY2JDrnXbPj/SJ7KurEf6HKKbQgXH
	/ON9e/IRQBqy1e/BIl5OmtHtykiUppsJtjmI5J4vrQ/CtpYjeVgI/x1Jt2R5P6bY=
X-Gm-Gg: Acq92OFax7YcW7JJw+yXhphOZIvyeKpn8Py9gLdC4bx8vUmm5vOP7YOJUIZqt25ELIK
	v1pRIsUJHocCtd/J5OMRRgfScnpedOdTzHUHVeecmxILkbl907shJlWgliBbBUFswlDB1vwEMzD
	rpQO6jYJgpkLr7WuE8z5lyBNUzpDWlQOTpjO+DH8kUD3t5kT+aGGLnETBfkLkYtqJLKTiIlvbOZ
	pC+QJSTo14i0fOhT7ZAeXyCNr9+JmF5ZrhUkd1i1YLLXo0ubdpx70aMsEA3egoyJANt5ge1uevR
	Kc+m/xfD4xmn9CxeFKnlmgi82Lfqt8+CY34yLSk/wWXArKVKR+AJnPbDm39+SKr0c40KbN+6gBQ
	EFryinYJF96h/ZSs77EtIWIrjN2jqKiqKVXfJKDd8n0WLxj3OSlCodjaZxMA00q9ZHosc5sKyvD
	wz9LURh2S8glJL5Nn/4/oCiNeqMxgs+BZ9C4x2LC/EKV9pvg==
X-Received: by 2002:a05:6102:3ed4:b0:632:3bd5:d580 with SMTP id ada2fe7eead31-6c6a692c706mr2038896137.24.1780241800554;
        Sun, 31 May 2026 08:36:40 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:632:3bd5:d580 with SMTP id ada2fe7eead31-6c6a692c706mr2038885137.24.1780241800047;
        Sun, 31 May 2026 08:36:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06892fsm1579390e87.13.2026.05.31.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:36:38 -0700 (PDT)
Date: Sun, 31 May 2026 18:36:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] clk: qcom: add MSM8x60 LPASS Clock Controller
Message-ID: <qwqfndeyqbj2zg7q2wdqi2rmxomlrxr63rx6yck4dv3i2234rc@xfhu5jfftkzo>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
X-Proofpoint-GUID: gy0Kd1ooQC5lqYue8tEZPoY2rIJZhux-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE2OSBTYWx0ZWRfX72+cmPm2fP+m
 UeOCnQqqkDKW8CDFcaVRlLVT0awWrYOTbFFRPcH5XYqFloUikntt05HUxVVyytEL0KpyhZQmsyg
 HL2a8HlrhU5awXXKrnLVqtz7LeoTfMYC8LZTSInE2FqmTG6gyVYYVKZ85fFVGG4tVi93qxLbTJO
 AyPok3aKCD4xqr4cLskBCKhPFo1VO/ZGbSWvpFfKPNhefhTQlkxUjaKZLO1tHmxDT4e5oOMf/M2
 7ilnQnJW3LIbmBpAFOtpAE5/pdUNPvwIy+KdF6M8w7JWSJUJzrcW9Os7NYPwLe0oFslXysPBzKB
 ty2apxwaUTbjxZSD2oVVnOLQlQTRzLMnjgmvrR/EbwaoXh5nBwnsnDwUMODNGUvIttbo0QZw3H/
 E+upDM9qxCpqXP9vvpxpB1egxrrLOpfZXvRqxMKfhrIeP7hULXFCF9ppi4IJWlYdDTrw+oHadqb
 jhNQMDd8MEPpfQO5wtw==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1c5589 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=O8aYC8MWdK4RqN8XWS0A:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: gy0Kd1ooQC5lqYue8tEZPoY2rIJZhux-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310169

On Sat, May 30, 2026 at 03:59:56PM +0200, Herman van Hazendonk wrote:
> Hi all,
> 
> This series adds the LPASS (Low Power Audio SubSystem) Clock Controller
> driver for the MSM8x60 family of SoCs (MSM8260/MSM8660/APQ8060) - the
> Scorpion-class generation that preceded MSM8960's Krait CPUs.
> 
> The register layout, parent muxing and divider topology of the LPASS
> PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
> driver is simpler than parameterising lcc-msm8960.c. Both drivers can
> coexist (different Kconfig, match table and compatible).
> 
> Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP needs
> functional MI2S / SLIMBus / PCM clocks before audio playback or capture
> works.
> 
> The new binding header is dual-licensed (GPL-2.0-only OR BSD-2-Clause)
> per current qcom-binding convention.
> 
> Companion to the MSM8x60 MMCC series.
> 
> Thanks,
> Herman
> 
> Herman van Hazendonk (2):
>   dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs
>   clk: qcom: add MSM8x60 LCC (LPASS) driver

ALl of your series got entangled and linked to the same thread. Please
make sure to send each patch series separately. Never send two series or
two versions as reply to each other (yes, new version should also start
a new thread).

> 
>  drivers/clk/qcom/Kconfig                     |   9 +
>  drivers/clk/qcom/Makefile                    |   1 +
>  drivers/clk/qcom/lcc-msm8660.c               | 517 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,lcc-msm8660.h |  48 ++
>  4 files changed, 575 insertions(+)
>  create mode 100644 drivers/clk/qcom/lcc-msm8660.c
>  create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

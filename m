Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D957C72F
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964834; cv=none; b=RAMiEixwKoAEFpYXnXzRrWOCY/gDEB2NhgMT9bEOmgcprTjXj/54oOmTZuaryFdbhDXVeU3XhJUDF2TEnKnHYNTztn6jWGS3IxbsNcteaZCqtNHPZcTBcrQWKeEpmqlZtLWxtrK3OiY5VVxskOojw2ouvLfnoq/L9VbL+E/kVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964834; c=relaxed/simple;
	bh=ncH773zu9pb68ueH4PuldOxRJVltvE/gmWzndPjXc+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA1uS5YDU1bnl+HVGTXf4UA12+gEVZscW/tmOCzp0vak2EgiYlPFGTZK/6c2AnwBPAEzldJkAdN+d0i0h+OKh3DTtdTW5JDcH78ICKQfCNx1WYHiDURv6GnwPuo2BBYrzw8J86JX1CFyynv36fn4UfJorQPbUkINLqAnieYux/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pv4l5QIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuFPjGg/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pv4l5QIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuFPjGg/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6nw599697
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 14:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=; b=pv4l5QIg63CJ8cz6
	uxg1ZcSuMQ8RNGqQgtV0FUaFN98nG2qEGqPgoJUA1J6NRrXIMO/RPTSdLWYUjfb0
	8WqijyAFSRCaQYGWIQV9USbTPvuF8FKk+GfgAQzWGQNgRSqNzUDGsMlLS/XjPufj
	26ZYb1bAhrKT+CMez3BsgNxfZgt2mI1FenKu5RtpHPdmlxZOSUKpI70wApwkvdfT
	9RUAUN7LlnzRAw5ZDj2jpGix2sDnS0BjEjkSrNJh0T4Esn2/mmPspSBaB+cOfK7v
	oandqRb02zfa6XzOrHaeYGmSvyYwozB5PoessXG8AHW0s2D0oAvvDGmifFNwDln5
	5fmvhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2rk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 14:40:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so9650819a91.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788964831; x=1789569631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=;
        b=UuFPjGg/j/nt2oyPL18E8rIfVr3XvRkJ/fopIzj4rDFx1DTDap82p6usgEptceVnRa
         63/kpDhloTLcMPsSWgU+4eQHATtvpmp8ZsOpHMzPXnSA6oDgLtOTKtsfg5hNdddc7jHj
         r64L/AZA5iHUsmvnhkWyqgEE51tqsDS8n7aGw8FosKZD8/LsTWkqlnu9m+x9Tjx162x2
         h6U9nUPYpEUe0s/+Y3VKZSFPkhb7BcOrQ/P6EDVBZ8V95Z0sCRCuwgiKKmQvthFXb+DX
         xhgM+QwwmP/Wcc93KMBXVcx8mUMnkS+O8uehxasX1qok98zYDymbLt46vPkSdj6Zqxqi
         p63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964831; x=1789569631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=;
        b=pPWJQg+gXka8AIA0I/LBpBoz0AG2uyUO+Lgu/f4gxNGFeH/8x+70aMlsebsx3s3vwi
         NODs73Yusetmq+g4fDIXUMRdCNcE66tnz9PAaKK5+aNlG+CsA/2SLnjhrC6DMDUcniJ5
         v1GoIXgQlAKI4zYAiksRLRVCm5LXfAy6EPbcwhGJXJ88z6BPNQw59DjjVrVDzo3fMnr6
         kTyyP1FtrW9epKQSgyyHNP85VybtbRFkWt0aeV5Dyk9LUeqq8VYg3kiVeiioSQgOf8Zu
         EJ1m7FVHH6tAvy3t0REsmHKIXFiq3GQ13HIc2u92Hgz/E5MS5QCYvpH6uQR6pmPjrBfd
         KeJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWHHxUbmbUROdOt0dOLjsklpIDRAY/QeJTdo2SwAroEe2rDEfk/Q8gvX2gvviO45ni/eNJpbKouqE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFVXFOCy3xqkYQqfAGQgBPKgh8fyfCV5i17A3k2KiyBec+UFtB
	gA1+ZsatkWGegeylgBjdeznckyo/DPt79dwRf2kI21NvuJGzvpFUPJSiiBC6DEjH3v6YbrOXj4Y
	BPzuE0pgYZFtqqEk/CXj2AXwHyx/Olux+rSV+8Qbjq8MDqmA++DkWUOFF6razbqc=
X-Gm-Gg: AYBFou0IIYZuSZuZ5lPJyu2xfIbFTNAE9UyxYGHzrF0BfhyuBH8fzYwdRk1YwMKLBG6
	vde49tl0wYLzIte2zhjBCVKRkrbSK2zh3YmzH2gci923KV4sqWkdJY0FjSA9EZf5mXdjwRLwbxT
	ADIV/enDZitKa/v3KhTc5BGJflpaEN6Xuuk0qctbwmN9IKQ6Mj3Mloz4h/TYG3pC54nmwInapHF
	b8aoqSL+l2DqZ3oHVBMuOllSmd7QgjRhE24Cs7kpReQN+Oq6LhhYwWy+gLvaqEaQ4J+UEZ5xA3I
	8Y0mdFEqMMnvFUFkO7Bx1VdSaaW9Fy5HyFpxjGuEtm2BDm93KxeezCR4MgsonhMM7TFL9/94Lvu
	VEiOqIb9f0Tunm8XD8HOxmztKeXWuRqU0VcF4CfonLshOKm0spSM2Y5lKe8G5gb/yjFDcrdeSM+
	5IEylevZyusm8oOls=
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr1775753a91.12.1788964830439;
        Wed, 09 Sep 2026 07:40:30 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr1775688a91.12.1788964829977;
        Wed, 09 Sep 2026 07:40:29 -0700 (PDT)
Received: from [10.50.42.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm38218933a91.8.2026.09.09.07.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:40:29 -0700 (PDT)
Message-ID: <b01a3558-9107-4271-bdf0-6c3d548cef09@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 20:10:21 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa16fdf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=_6l-rGU-S9tz05y7jW4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX/smeV/+6Ocdo
 SIWP7pv0SGCPgWRbvjJEWvrE+H+JrQf3nCdxnOn5IHrwib7liIXP6JoklZ38oqf1QeOC3GSQuA/
 FFrhoQHOqZR56qUoDu9WV9qJuucbaYT9aI78x0DcWSUH42ZlcRTHvdY4eAm3kdNrUodHJBRspa1
 +SbZpr+wM+vpgLsEbg5yLvl+/yrIpNaNwQguuCm/XtvRRo3dyUjA+oNRVoYpi4Y+plbh9Me0JQl
 6QeI53HYZgQEFdh5bduO7l8rRZ6fZTxJJDG2toF7zGsRV9okvvYxhvFIOKi9mmzWRB0QE8je4ZG
 WMdhCD4VSIvyzW8neqzgnxy0t+aSJF14JLk6Gez/WXyfjPnRHhyVso6U0DGvTztX7TmBSJ5bZLM
 Sw/VldmcN/EWGZOLKHwG8/pvir6+gfaymcT2ijOK0Uj1rvy1/70PX810E7+P8fVYkvY+EW9m0PP
 q3sdcYzvl2BU54b2xUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX1eYD8J9fIPhY
 xADXUYCbDafCCSIajyGzPj6LAHkvURYBKzHdDrOFsCogfq1+aDj9SNUr5c1gZVnoazodiu2koPp
 kVRFx12ipxYOidhNEWMoRx0Zr+cuceY=
X-Proofpoint-ORIG-GUID: 3arR4MNe9WKYqEn_hIMjNX-ATJywlKJR
X-Proofpoint-GUID: 3arR4MNe9WKYqEn_hIMjNX-ATJywlKJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090163

On 9/8/2026 11:17 PM, Brian Masney wrote:
> There are a fair number of clk drivers that are registered at the
> subsys_initcall level since some clk drivers need to be initialized
> early for other drivers. Let's add a new macro
> subsys_platform_driver() similar module_platform_driver() to eliminate
> some boilerplate code in the drivers.
> 
> This series converts the Qualcomm and Renesas clk drivers to show the
> code savings that can be achieved. Once this lands, I'll convert the
> remaining clk drivers this development cycle if all of this can go
> through the clk tree.
> 
> Outside of drivers/clk, there are 364 drivers that use subsys_initcall
> and I am willing to convert those as well starting the next development
> cycle once this lands in Linus's tree.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (4):
>       driver: core: add subsys_driver() macro
>       driver: core: platform: add subsys_platform_driver() macro
>       clk: qcom: convert drivers over to use subsys_platform_driver()
>       clk: renesas: convert drivers over to use subsys_platform_driver()
> 
>  drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
>  drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
>  drivers/clk/qcom/gcc-glymur.c          | 12 +-----------

Tested on Glymur-CRD
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]
>  drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
>  drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
>  include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
>  include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
>  48 files changed, 107 insertions(+), 487 deletions(-)
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260908-subsys_initcall-05dfd5fb0f04
> 
> Best regards,
> --  
> Brian Masney <bmasney@redhat.com>
> 
> 


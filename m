Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC901386C05
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478433; cv=none; b=ITy75GGjCEetBQ23C6Dx31cdOupF1zZksL+alnlzgcHUZtq1cWBnvq8hsxY+8JOND2iYNThzBIevF5iwPp9+GFtISrgye8nKecvyuwDaigMdPLa0xcXCO/qto8dhr8hZqMLl9dXUvq+5Usq+btW71xs3HRe3ywIr0UUjAOP9kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478433; c=relaxed/simple;
	bh=M3wrH4b+LRUZF3FN2M6DKwvla4BfXgDsUeFyx4ljtkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do2zashTYWbEKRIlAdJ/X24+5YQhFfPielsUQH3eCSvidI4YvR30NLjnhaxWVeExwOo2Z8IVuxm0DxP3iyBggWs9DpCnRaQZwizxL4BZ0Ki/fP8DflU8iKbhWZJvG7j3XyJcF+L8oy+gpJQ+cc9/yIUAf4SkzL9OlZQCkyueIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmro4bmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6G5CCca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmro4bmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6G5CCca"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKhIYW141376
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKYqQ0dwW8xuJgMJdvmszTAy
	PcSofCCo8nVIzS48A1k=; b=kmro4bmonc+TqGDtD/9KUXC3tqseV7KpjWqogEj4
	a0QCUv37Nc03txe184DLxG3DcNMAEoMTWEjzHgCSmvePIvgsJHaF8W52m6k3v3Dc
	9/b7KDE/GLX5XqOQpOT3Vbc0zidboUWQg2D4Sw18NjSctgF91TSiOIRzm1XCnGAX
	4lO4YHdu/cCcyynOe5pr0vTJjSakbAKgZJDwQJ1RDaU2wS+qKW8MQtD8ofruTqO1
	FTqxL6x+n2LuTOXcPZ4IWvv7bC8SS6T0Ltp/uUP64z4DrIjp196uQhYvUpN2pkNF
	QY0MgplrkHC0MbmUB7H4FRnX0tT/Q13V5MA22WDY6NzdLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q090aa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so12079581cf.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478430; x=1775083230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=R6G5CCcau/Ei7EWBPVn13nr2bAFAaL9Lnje3bLaniCl4dXD/R/cf9sQDkqi7JlBaBX
         /jf+VS5aiZdJOioLxD8Tx+IQEVttNC0bofzg/V8Yi2kwMALFaTmYfRjBU1WSbA4XsFg8
         INSveh9k2z6SBfgRNYiTSkoILXrTnGrRmTZnJRKX0k7BGpB7XkAhREyQPYSWzxBizzdn
         UAMHTlrRjCzq2Gvs1IBsiPHvAdlES2gwQ1BI3ATv3YB8lzhF2TSPvuXHqzU8qzDnG3MM
         nt+crF+lvnM7FZ1wZvmafKF3+tO4Og+qSpUBt3HF9GNPwSBtbEEfWdf9qc3/ISfLa01Z
         a2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478430; x=1775083230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=fWp03sm7HI1c14kR763Y+bgAbWt5dV2fPaU68+tlD0VHdTZRpqbdqXzE5aTo/XUZ0c
         /nYhogU7BzLrWCxKtnMdnBK1whku6w5xUqm2v2xA74vfs/Lw+reF+KQzvlOYlsrMYfWT
         mPCqdfNBtpyU+akSXeDf4Jkz4WHK/7u/581v34dUAR2UICymjbIYp7Ie5UY8RbxGSPsY
         DytC1NCcIKF8MHV7uJx2PrQjbm1O3+hhQHjOplivJkAJMdSdG+MaR/RsECxOGR1pMU6o
         PKyy59Q1FDAyiwcDhCIw7Npx8X/ZFeDf70DGewCDRx7DKfbxwVfvHtyXr9UkOr8IwmCK
         wgNA==
X-Forwarded-Encrypted: i=1; AJvYcCVw6P6aMigRoLAgT/IUFrTCHE7QmWES+JonG6+avjEroDN8+hRaY/inaHgRa1xXwZof26vpJP46/GM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVLf13M160vSNbKrXGTnpkK+1h03PhtywQEccYMMfa9WIqogSL
	O78SI5PGsJPJwFo8f71lobQYUN8tZPkAtS9TuRPRdXlySjI1gVlDeGwUNGPvWjLOVTs2YSgQ0Zd
	prtzpiqAiEzn/xdDpG+myh7amj8zfB5L0N7Bw4LjkzwnSAghoVqUepf89YbEDaPI=
X-Gm-Gg: ATEYQzxAmiF0XPk8SbqHdfV3sADWuun5nlA6M4uJUMaih7SfKIEpWoKSjk/P3tDsNsT
	yOfIEGkL5kjJfGkffipReGCstUUiDKR2eQTsor20HRfaGs8oTm+5nZCjbLFifJmTYWlvfugQexX
	OUo8wCMdi8imRd/7y049XmiAYq65xuajFkbD6qqiuzSk4NgAOeRRQaxOmruig3BZ1i29RvYUEsP
	WHaOjAfERg5sxilkaaCkh+/boYXQLiyUSFcleGfBvtwQLmS1mooyI37ke/5dwRmoq1ApM5AdusS
	KzF3d2KU7RgqcaNvri8c0283akDb3bAewqIHUn7Wm8o78AHwlbPC5wRezmOa+907pIMfraCeVU4
	AVQKxof3agpG0/ciY7G89AX2E6zvJACl3ScC/b/wzUCkuTtwDVRGbrOjD56bINsMMfyvZIPk=
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662531cf.4.1774478430172;
        Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662151cf.4.1774478429762;
        Wed, 25 Mar 2026 15:40:29 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm1810051fa.16.2026.03.25.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Message-ID: <67d4gbz5tccughmlb6tkzv5fgduo7ih6ht2avcq5o3deiwjkad@wt72gfijbx3u>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4645f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vaqIg2kkDvR5jWT7QgcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NqqDFTq4WbTMFJwmENDbCG1w4AGTuWT1
X-Proofpoint-ORIG-GUID: NqqDFTq4WbTMFJwmENDbCG1w4AGTuWT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX2SWrYAMODIXO
 Q5JKCfgSVNVsea5tHBSmRmn1atbXHX4Q3fUPf1ZblJIwUWfK9BfLK4OzO+AP2f5Gp4S2oTuPUia
 0Z5BXa3PijvWYLRNoiAiMLbsihMxxu63UBg7A59QIL+4mPm07+/AdwOHbeEqAXRSfqxBE6G8UoT
 5KHBaRvtRG7MfEukC3SNMjJvIMS9rHEYwc4v5GcT9DB/xmbfsQg1RuPjai9X2z5fgchDQr39ObD
 CK6bPD9rj/PvBgdVr/j3Swa3YLBkYx1zmxz2QKiTJG73ZWjUiqqb/YzSzV9Y/9KhwKkqE+Dlium
 XHaWjyveq5kn8+mQvf3oU99RNIb/kRlUdMRu4+m+6T3kz7jaY/I7BA+5zMLWNs1gtMINrbhsjxi
 VoSsiY6sjZe40Vpr+OQQBjN2HgDIEeolOv8fje2pANHm9hiGv49I05iqYy8YzkxkmTWSpVXceUo
 +adzI+YTkguqqM3KDjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:24PM +0000, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FD73264CF
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478497; cv=none; b=XtppN94dRkXA5FyjJfMnV9fzngDVk8qzFxBx/3C8I6d4HvsSPP8k5FEK3P9X8iH0Ca5J1uOnBmmABWdgVQmXlEnLVw2rkM3MP6nees1ieaeNhiDF+qstrPl+KoTfJf49d4SqJDp2hd0wfrZkaC83rFmZdpI9d6I4xCD0iNrxVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478497; c=relaxed/simple;
	bh=reMknFJoiqNp4mtflM/9KnhX9fgjE3GRwZFkcGD+Fb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQIlTdhMDvOFI02MaXK//KFUoQ7/bdn3bmvns7aEUKaK9m9r/XJhUz8YLSJ6p6+jxp+XIIFvdO/m2E/nvXKKVeob4TrvQzMiuo2YK7VIF+Bur9crp8T/r/4yqp0/9T0DhNStFgcvmLdD+o1z87vhc8it19QXFqpuWjMFdd9FgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n01125Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMYiB+qQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n01125Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMYiB+qQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHIwl779775
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MskXGsEUY9X26Q4Lhi8JX7q2
	GLBZq1hRtzx+iwBExXA=; b=n01125ZbN+KnMlSr+OetFhmadiRmMt0bJWr64P00
	89KrmUqKceQyI3RUVdKojgF+ZgDVUui7OcFniBTrtD+Iz24GdHc7doAns7E9CiTk
	nt/KhkxExEhNozicRlFIC0CrkSuqG8Gsu7vWOUNpLejYRkOOmTQrdLwkDjN9igap
	iJK37cBClmOt7kgs6JvhImYfbIWAulo3li7Ybuh/sIlHxHs4gyz6n5zgGuu1kVTn
	hLC9y5iz2PoEWn5HEijPeBZTfS6P2YtgW2wAjE1zvAFpQAo+/++1MHyWBeDAvDP8
	+igEx5FTlJV9i26rCyMGYf8/R4y9/FH9XL6UIe5uJjmAfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp2tg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso19821281cf.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478494; x=1775083294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=IMYiB+qQ57eoKocLtiELbbp4jGW/ZGRka0bjB2CRoh093YghlQKq2cWOgmtlhLQE9Y
         kdmREAF3W+iigqOvD+RzUc87L6GIJ0W8IWSN6YyOz+yCm3qJVyEBDMpCpMorqG45kIrx
         pUYcZq/w5EIO3dmlXipZwBJOFG0OC8DAW87EEB3pZ52CA1kwmsxQl6D+VkaXyRpDBw/9
         b82EJEtvBlQ3Pom64I/my7z/UCvSN5vC/RHlZi2Nw8Kiyi82D1yvT88yA9GgfKSo8FXw
         S5HE+TvQ1Qgd6SQ/Es90ncOGcLPwUDdPw5e65uMLEeovMHs2K6PmuVD9xF3VLXOxxhJN
         ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478494; x=1775083294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=a/qgyBlsAVNdcaCEdk8f0y6FOuY/jSi5HAhLsPgEGWT88qao7QqStqHBBSEV4MsA0Y
         FqxMSzcoXPwVLsEg00F/xR71Y7uDs+U/3MfqnKXPwmBmKz+3wKnkCOQr33u5HV/5mI2W
         MSFoTCPPIQORSyCouFv+rcvP/CCpvU+BhOfCi24kdUSU9mUzSKBjlULvcwkMLZ4Ozwde
         qniBNC9/Za7nMGaBwK22VsNXTaK+TgCY7xAejqHYwGbYkxrI07md9sMgzBOoKsBn2aA0
         ZVcLIC0/dC9KMNrvzoYU0YyBTjslSipbQtNGe9AyNz7rymHKrVo7bUXO2lVWYWzSqWeb
         S02A==
X-Forwarded-Encrypted: i=1; AJvYcCXmIbS3431cLgOE+M27HIQbjR9HrdYEtdUM4rrKSlN/+I/9FTJ6aTM+VkhbzvMbHt6tq/Nc2qLGlLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyulyXgrOCcZR70cy6hzv9YbyrfwWv3eWUsHxO3vy/J4ptMGHi
	pJuoeFaubFJAtFLqubeB/vGhB5OQCqpr9DXhGbgoNlGjN08TNTjPsjZ+xvA5+3pvWz8ylToEBwS
	OqMKENzWGqLQ/Gbi+ciz0ekMcAdWhVw6sqIfmC6CvTAQlxS/hG3vjbcjsMb+ylFw=
X-Gm-Gg: ATEYQzwY0JwteDon5XS1Z0uHClymPJKOfe257uerfCWtKZ75P28qrw8C3mH8k2Idmr9
	p5M1s9rwFJQuBUNSUtoIVudWTNZWVJDz8dTbiiWp83gXlVS5nURZ4v2IJQeojswVfjkJB8JFQDa
	LhVDHRp5QxIbcI5FruFec0qy8LZwdnUllaOfgyw+CBWJzkO2m4kqfcnpr0mL464An5YM4Ptrula
	cU6AejGrs0AHjxAQCNIEPcp6I/Wo5yTMbYAdlglfVRbUqcK5GX7yAKfSzpiov45NVdXX9mtODaO
	Cla3yy7o1ZnOhirh564AxMXHM6RxMXlYMTECLt0R6F7HlWT+rIUHErPy58dsmoIzmOSb2xgNMeN
	wHyNHWCCeV5VtMfQXB4v3qS4azAnVVhYheMrJpEzc3QB1hG3Stt7u7xZp6kiEJcFuC7bHaMvopP
	CNFWda1AUCgHm2PMwx2GERu0HhKIbDzHlcxKE=
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79554051cf.16.1774478494542;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553741cf.16.1774478494141;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064534dsm171727e87.18.2026.03.25.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:41:31 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:41:29 +0200
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
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
Message-ID: <yfm36fgq3muz6cw2bizgg3h7bejq2tj7sxjeorhoi7tafbnnjl@qeipinzvbpkv>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: DF4d9FWkGop7VJgCPhpB0qHk2LlCRUwX
X-Proofpoint-GUID: DF4d9FWkGop7VJgCPhpB0qHk2LlCRUwX
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c4649f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=3mFuQuvshfmmPt20Ni8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX5bP/73vRNpX0
 j1Jauv9SVwRrhj6EvRNa2lXY+agXvrgbur0U2ycXRV/wjiIb3wOZ4DeWjxLORq4j1H6s6MYzxOd
 IVAQ2wIIVk7UmMPQG8/R61Y650WSQsNKLUgotx6yNU9flYiOipEHcMis5ZTLzV2eD3g0RKb53BQ
 tRK+iwIhtZpLJWBgKDQq0qWMKy0+JTCOLSQOTxadZ1HXKTdOLsM/U20nt1OWEWUssntMKchp9kW
 H90Ro7S3vGfqlzeIaf8vwKPL5CnuEwqGwbuQIxAX/PgOgYCKqbKrIv1htvpNo/xO618H7nrBI1y
 wHnFyMfpatJLgo6bvTaOA+u8hvAisu0yALYKaKmlPcST0aK8NaMKAW7LOKb26sU1lSjVeCB7Fxl
 Y0cVRpPCBW9sYqJutAkyMwRaIG6noRsrnJ+1HFUQBC952UIN5N9+UbX5suicicHRumAapn7q7CY
 vMJudPDFMk7q7yNMZ+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:29PM +0000, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/

Missing Fixes, cc:stable. Also please pull to the first place in the
series.

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 153 ++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 75 deletions(-)
> 

-- 
With best wishes
Dmitry

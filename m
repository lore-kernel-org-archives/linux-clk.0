Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9035D360EC9
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313651; cv=none; b=S+FY75R7U+y5O5DLqV+ZbVFgEDj+HtQyq77AA/9CNa3JKh/e8UhFoQYTEpjD3PxwE1d7zeX6iydmy4KCYfimPTsyEsAhP6TjOVa58Jn0TczxZt3Q9qeRY4qW7/nQbtdWw223XQhTPfq0lEl+LZP8Ltzcrpbs1+oTMmInu3jpLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313651; c=relaxed/simple;
	bh=8KpuVWQ6jm1r2rEeu3LN8WRKYbIYv+jQSd/1TldiGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFBlb29Ni6dTpcepfigpW8+xAURPUh3hi5D3P7vajuvpUeY55PNckA+TgPGQqRX058npFYzrwTj9v8nDpUXuOEIdpb5pbkERE9uTL9It0Tt9mE2njRaAncSfDWPpDltPhHww/jXgMIgahqF0QkW/Ok7KNc2TuzDChxMxK4bXXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGd946rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG14OFk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGd946rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG14OFk0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517aAn72866025
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Jjqk5PfzznUHaFXGq7GmW+t
	L6JCALGPf3ThF49riC8=; b=hGd946rT0wOrWOdrGu7/KB4ryxKyr6s5qWNbtP4x
	Z04IOx/+Oh4TjtDn3aZYFTYlaCTzOaae7GafFNzHfMf6tZnJiwUtH2/4dSmLFX86
	0SPejkUqvdOGp8/iVCCHrTtfN6H1UbrR3Ox+RhaEfXA9wZ0l320djF471iJX8sPd
	3l7IOf1pZB8KNb9d1+VaKc3XrsuHwpwX92ED3FX+toFbiNceIEFuMXHu+0zIezHd
	FRf4rsVm9teqDbQAmM1/h2I4Fe1Y5gr1pt01UuFOzXidaX6ZOWQU/pMxy7jW4NVx
	ofWkUvOgWHDm0pzvhe5HhdlgKqVYVkscAC3lY/jtHRCukg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ffdk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:34:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd47ef988so1850265137.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313649; x=1780918449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=CG14OFk0getzBzeKUnFjFOu8tT/BMejrhSAqw2YCM2BzWaXyHwY7Rb5TIlWG39GVid
         LQCHCP8BNsxDxg63jzcOm7NvLc60NxdQtkabs6kJYP8FVaqRsqF64uHAn9332KQ/sczK
         0NlAGj3DQdiTlDPVTyR20qDkFzZihhGtpQkUgTVnynQNNxOB1iiD5l/JALR8PhfP5bQb
         JPqsST2kQPUAceZJSLtz+SeygMF/+iwAi9qSBnuYi8G/3jrJGfRabIxfAIXLxrN9hFOi
         BUwkzJTzUstIhYviVE27Liipgjxx1lRu4LvNRo1y63xsrqWh1ZRYk6fnxhWTy3rwFDEY
         Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313649; x=1780918449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=fgFTSJNu2/v2iOi+zMpV4fSC5wBebzYb/BS0ILDPOq99VmB3eFAtG2vd8qtniCoups
         bL5Guqa70I212mAJOss8urkGTlYSrQS/a7uHaoSjpGKAOkevQ+7sCvH/IiKgE7wkKUoU
         Rbs+vmx4eBF5vx+qKf/a0AztV6uAgC78hsr8hb76Q59Sl9gGMsSplqSDk/XitQy6so/u
         n3rP+onhBPLN3vKTGhj/F7/0w1ZmyEODVgljGVNie0c3bh4TA8caHNkqQ1wPuipA3E+n
         HLz1ayyzpbZtBLp5QJlEGNWbSyNT9sWcv8c1Lo8/lqYio4YN+6JOqdHoLMdmt/5Tjoz3
         02Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+qu7tDevrXv1z65JmDpzCtPZVAVrmvQuQnSbUWX1U0tlj3Fc7Y78cKVbe3Kj4S4nfIc/lCC3vjrVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSUYp0ozUrOemTm/LeLwGSMdh74W542rKvUWKvZyDL7Y3cbf8h
	lTCBBfnieED8YccEV57vXOR7wkCZJtCXW2wH558dheArugMhexmShFZmiJ24ZJ3E1JRAHQOEq+o
	g/KKDg6+0AEpRqx80hdFV8/TzXrtmp0YnRfC5ZgpvPBQPp7zW+9zA8DwMuvONbU0=
X-Gm-Gg: Acq92OFkK8P25UYI/AZn7K6PwQlZvAkTTo3oV+vzehCKD3ay46g3ycSJ+qRZzj28gAl
	BYc2erSKQ50WTnwCeNNUP2Ym2j/gBuXS4z5r1PLMbt1YEZRwTbubRptNRTymIOvvzyvzPdQ8Zqr
	nkMmjmF3Tn82m+FL+YojJxZGQ2IhWF5BrH4h5VrAfmL43xK5/tC9jT3ooh4hAnXRvpsntiO5oxL
	so0LrAy40+wrrRwRAHuGU6SXSIjxG9/9PfruAAWm4jB3XPVaU3c3vlQVzXEcEaJ7FecgPtYCUU/
	3i1XJZoha+xUfwPAgR6DaZWg6RJig8lQQ+I5GS9gvCJsY4Fqu5RD87scyp0xIFdYQMbBR6N6tfr
	JoYuDbvmSZt9DwC5Bv1Nh35NFvmsZjTbcfsxV93UxP9amMun4WxvftATdMjVawXCAqlNGl+eEqC
	tdGVwmI7aKYMR9zOC6zsPxmJ6jJt6YNKeaSSowiVwcCq1yEg==
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027200137.31.1780313648836;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027178137.31.1780313648408;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659c91febsm20928961fa.15.2026.06.01.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:34:07 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:34:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <4t3vit6et5coeiqhv2kw76qyxki2qfktf2wiczt4gzohri7rg2@eolb7eajunj7>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: 3WwpRwXyOGaVpUGAgAwYMlPh8V3zD1oT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX23SmzJeAJihq
 n+5+VIx3mBrP5bhL3whXmbiWKYWGHQME5Jn22gIQ7dxZc6ZYcn8pzRlPOu9o7q1HzcvPusps4DY
 RQlffbAGsXOA/V8kcZtoO2Xw4YuAhoVqkH8I8MSsh0zByRTWxH3XQ+NkjI6PhE/JqIft1hpWmjG
 xbulI4/rAnvqhQ0Q+VjwfaYl4Oep38Q4KnfNDG2F8z376FNiYQLPCcqwIELY7xcmlEj13VnW8CJ
 5Az83GuZRCJna/XOVvaQgaYJiMi/5iG/vYEyGcUn4HYH8/+eL3v+4sxPqt6EWCVt9OSUTokWK/1
 V7YluiRvLUB6gFslTkFxYIqXxfPQtdQgIJsDGnSmtL02WY8kaprQWDTibiZ3E1B7aOqGD7AveNq
 zyhonNfi9mKCJljNv7shyB0kQhDcnmNUqd90k2DGXwDjJQG9xVHo+VIQDr8iAHDJXN7xgJz8auC
 X6zk7p1mxPPpP4R2fFg==
X-Proofpoint-GUID: 3WwpRwXyOGaVpUGAgAwYMlPh8V3zD1oT
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d6e31 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pn3paz4bqnjGj1Rei2QA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010116

On Mon, Jun 01, 2026 at 03:51:16PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The msm8960 RPM resource table is missing the QDSS clock entry (resource
> ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
> Add it so that RPM clock initialization succeeds.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/mfd/qcom_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

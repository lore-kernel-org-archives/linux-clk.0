Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F1932A3FF
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775252; cv=none; b=kZmenmPV07XWZ361jmy0GSjJXMIH0xxRhd9WiqQmyqpmNS9PXuKQ7k3bce11uGSxhvS71AuwppEfbXySYlHHjK8DsFXNsXQv+aTvB5QNzkpJz0bOG7h0Vh2K6uBWIME9gnMtigkTpkKgrw4CTbRU/gkp5Xkeoy3xLRfQpWoCmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775252; c=relaxed/simple;
	bh=qWKEGMsRAygprv1qNcmSHZbG3rTbI37GY6knmYEGeU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEZ3n/h2SVN9pLp8TzjxbAdCPzfmFYSBC09Ol0F2XHM+SbyPeOpyQz1wanCyO138mes8XeOMnCHWSbqXZvDEWuasKowrwjazCEDQnXokmtx6APm/qMw//WWcSgxVWDKzZTF+QOG/cqlXBQyP0sNMDATh//aH/8B8eA/T2/ipuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Meq+sh5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLcmYQnQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Meq+sh5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLcmYQnQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5UKud080260
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+snBfc2EP8BesCpZmCLz6ucu
	mRMXFltIhUtiZuC9Q9Q=; b=Meq+sh5/iF2mzbUpaTFOxLidIsO4eUDGB+mmWx1n
	8JwmMIEaNMW7qm4yWzOulUULcewGt3mJ+5u3Snfq0myDP+LCLCTTYZvJyoihmn58
	Mm5wnj9PPkDJaEGgaaFMrmSM4Ecb6BKLKNMytPGCPbIbe1aCwex4C8p0Z6ggOakR
	prPk5qa0/1h/+QOm9RvI0NQAV9PfPefINRoZFMY3CnnPdX8v+I2l9oZ5rCge4seC
	8wXte4SKJq8XDIMT1XTuUbS6OPN1iNBbBZ0AIJCB8Cm7XXbWNizguZbmITmsiyUH
	h9kCXfGeAk7Qv1ZV9ABkLKkqSX6UqxfYrFCFXJlAwOQw2g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmab665-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:00:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6443138516bso14210535137.0
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779775249; x=1780380049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+snBfc2EP8BesCpZmCLz6ucumRMXFltIhUtiZuC9Q9Q=;
        b=NLcmYQnQBg5LVX08V9/rMVwvmCu1TB/ec/Ak0C1+GB0IKiue5yISEei9EuOhHo5LNo
         /P2gIaBedJEG3Zn0QnZAVVb48HP4U5R5bZCWHtTBmjZFhXVLWvf1uF7L5HEE95n7z1lL
         R4Rz+530odW8jUhJBxFb9uQJ5Vum1D/QQlHsdEzJtNYaWn9DFjDvdZzWEaU4IMDlFvxD
         56nU7XfGlLxrjS+ivQUyKU6BhxJbkIM82dlVhL7IsP0ZWpOt4TqsyTvR5xNdICPcajH2
         LYBLhfIDW7nMmeQBeBY6FV5OiMnHLw8zvOrjUv1nBZ1+82+cbxtAcXym3iis2KS745EO
         o+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779775249; x=1780380049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+snBfc2EP8BesCpZmCLz6ucumRMXFltIhUtiZuC9Q9Q=;
        b=n2jOR3a5pUZCG7YXnfGp7FtfnMbZXN4IeIhfuN5OrJsj7XD4sG0nJagSvHnoLnBnw3
         +lEJYxTwc85YUOxiD+/iiQCY2e+SZ7B3AnSInPJgOMgsPxtVXDPkK1CFuBoIk2mXcjaL
         jRosUrGzUK2AsC9x8z2wOPz9hI3J/nKCvLsnIhhHT9WSqkROQVh0dcQK8i6WcVJqq2fG
         cGGGPqj9V5KZaQ9Jm16eJxg3q7AkcXQfGEd1AVu95VB/Okq1jB9wnBIn0VuWgx/wBoA8
         DIoyEJn0uYlLpVBLkzK4UKjKlZXB0XoXxxqmUDVIBlx5ANpeotT+aIeAhKUR8j1CTWV6
         u9aw==
X-Forwarded-Encrypted: i=1; AFNElJ/Z6MabypLMQuwe2L2CKGFU4F8YVXsGsi2cShPVg/0bHDFvhN/S3OfLzSOQj+UFZhs+J3hpY1Y8GXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNaDTt7Qhb+/3hnss26tSn/qQ+VoeobQFo/T0vdNuGpCw6oUf
	7QGP3G5rYqN47s2qXSJ0oZiMLXD3ORNfBVDkvn4n9va1O3mH5xaIQPHbHj356cjSj/4vuR7pSuk
	m/FkqTpdM1Gid6+3OfdgnR72ffMGwim9+7PNVEYFv1zr4u9n1JkICHLU6e7MnKqE=
X-Gm-Gg: Acq92OHhnbJNiwTlU3pq8Z5Ga+CnEbhb4Gm6IV8wJxbEB+6Jufgr8qOLdmJIoytR+LY
	cjhz38zE9elDmQ2A59ui9Xt+RTzDpq4zOy9DglOVPK/3gvDwdlCx5pw0kOG8d4qZe0zTplkLT0+
	PSN+FPrxcTzQapebB5rO7lF+rZ2Zb00gN3geDdncgSIRHN5llaYxhOjIeM7R9V2th9WpVxehEZP
	yAyEgINr7PLpwV9uwTRckab8MH+MUwB72pUFxdpWQ8jXYqmFuA2E61nxLV/ZY9/yX8baJIC6A1z
	Wz6SYElGlj0bjNoniTn2lQ6IIZUtl5GSo+43cj/K8MEUEohPvBP6MvFLHWGQF3F+TQyKL3YC6RY
	cUElNYB0AhoRoTAJ4yykwBS6hh+8RW1/k11JWFRuONpCucnMgE6t8a93ob/CvugD3EYfQsbQVZp
	ZhdY/ce9Kpo8CSw4K1iUsvvak11zArye+ZgjQ=
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-67c6f741653mr8573240137.4.1779775249061;
        Mon, 25 May 2026 23:00:49 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-67c6f741653mr8573225137.4.1779775248578;
        Mon, 25 May 2026 23:00:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d550sm207734e87.81.2026.05.25.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:00:47 -0700 (PDT)
Date: Tue, 26 May 2026 09:00:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Message-ID: <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a153712 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TVveIvzGzKhwGn6Bp88A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: WM5eEgcVVo6vL3ubq5NGDpXEDj8LT5pz
X-Proofpoint-GUID: WM5eEgcVVo6vL3ubq5NGDpXEDj8LT5pz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0OSBTYWx0ZWRfXxdE5OX/ZqW8H
 zB7cIDQfc9flYJGZqTvogj9TJRyDuBrKacD+fYVpiJKlMeB+sNbKEEU2+At1IzeHFfBO/oCI6px
 FsTESQNnxbraDrVrtsph7zrmMYZAZuj8BnSGpHMN4sSUdFQ2BKlYXN+XNSua4phBfw35FLAhL+F
 XyRrolXfG6na6yLctLSNtgK2seh2/X2qKJxTXB7hwB0T2HOhZhOVju51kOx0CvoFnR8MJcyrjo0
 q1bepPSd3SzZLPdn8gQAMYAqWJ7nMvQIxd5J1pbhp6h5jnFU98/x2nhvlWi/r7UZ2zAIK+y1qRY
 ZvHgVnpSmwjG+PVZmKXmxYzK9vDHgg4o05qoa6w59FAXaLQpFA+cCaMN3Q2xGwq41aXlm0J2oZD
 TNXVlkOZtjSF3K0xc3eouqbXR4mRmn/GmNrHtOAsHc5ZO4ClUeqByaD6YZt7e0JjJfg0nnhgc17
 hFzXajb5qv6rKmiC54w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260049

On Tue, May 26, 2026 at 10:59:47AM +0530, Taniya Das wrote:
> Add the device node for the EVA clock controller (evacc) for Qualcomm
> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.

Nit: evacc vs EVACC. Maybe it's better to write 'This controller
provides ...'.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

-- 
With best wishes
Dmitry

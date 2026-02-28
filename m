Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E59A364EBF
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263073; cv=none; b=QIl6GBN/YciuqZu3IkAgRBgxfEE9KmIteVi3p8ojcCgmZHosULCAGd1bfYmdWIQbtdDjRsv7XBZbNmqRBA5jL1s1JmsdNSh7MRQdXuNpKJxCx7Jev62+By/1a+lLJplKFLwJyqg/9dpWtYj1nJuiAy77hm0L+CH/x7PTaPe94yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263073; c=relaxed/simple;
	bh=pjHPMCgxqYfEhJbUMXAgV0DOg/qXZ27i6nxNztl78RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3PPr/G9ATCZHVSq2SNXarpDSGDgp7FJzSbnZF8INRlGttrTon26eH/uLd1znsF2v4rI0xpu9t1ZEprbZlQMScYt/i0HnaFk2P6A2xnOBIjNM/xQafWBcrgvLNTDYCScpCB596he4UxgwFpHdCUgIh6qiy0+/e9CKWpu1iRN1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo7p2Ff+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gn9SzwvA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo7p2Ff+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gn9SzwvA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NcIn950979
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 07:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XhQNpl7AQEod0mH40aeXlLKN
	V3u3+gs0tTBY/guFsgU=; b=Fo7p2Ff+Z/f1vIf11BNVx4/AywPkMuVDlKd8AXXN
	RLzkKupz9h159MGRlgAmMa9s/Aaju7o9agFqVNc005CPe1qjvCwEi/OfAA8mKWB/
	GlT1dID9FoQDZo54kKNBh3bWeGyrec1Z0f6PtK3DDtRpGRusXkljTt0h65V6MZxq
	Li8F9VsVMYOubnQXOPejsTgMI2SX8l2KVVxMppqbaqeFyO8vqWtV9Uk/+Sa257Zy
	47LiX5KEznMtqYCDYqCPoF5Izj3aTEoSUABisa3pKKUKc+H9X6xGK5Hy+NyjSVEF
	cx8GuPvNdIWmQIL6Rw6F6O6C74XaIYZt+9TJbaEhNVhzDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn40d25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 07:17:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so2055788685a.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 23:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772263070; x=1772867870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhQNpl7AQEod0mH40aeXlLKNV3u3+gs0tTBY/guFsgU=;
        b=Gn9SzwvAKgg1DzX3jffeRHAMS6w57mE7YgelU2anGKbYRYf1jXFeYOCQO2/HFQhBIb
         x8P2yoHFt8uo0VZi+he2SBgxrWXNKaN1JDJfEKJ1yU35O5NAPYgT4rdVWc93GH9LxHtU
         ER3VMjMQTvc+81mpkTuDMyGMTStficR2fMiJvARqoHt9xGUhPpdE5BGP7ZTymcM4/mCq
         3GjqkK33gp4/VgrJ86QflEYxHHAIvk+DbICuPHyXSoeirBbhaqqqVv8d9o+lIW70RDWS
         B5hgkhEsgWz8haZDVkHqdprGGeuZVw9/qfFjWcr0AHJ+Se6vj92H+XtYuySqwF9TIaso
         HtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772263070; x=1772867870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhQNpl7AQEod0mH40aeXlLKNV3u3+gs0tTBY/guFsgU=;
        b=TPhUdH7+V07CXSqIRkZvWhq1ciLfahSAlKEd8rhPZjMdfWMT944ePc7RcZXMDxPA7s
         mD/sZLXOQApCdA4ibiVgLKwN34GqW8XRgavTu81bbVtom9QjdA8JCkhLjXYnP0C9P3a4
         +C/7W7qtitLzTnZdldQ6eXKbJCZgW5JuRM4IZvjDNGuT7kV5Yz48/wiYG8B4MbUrcrtN
         pvYoTEsAoy5CLjV+5Lflmh2UrDdFHgnNtLFKThaWOMA5YTpwIyRvCPSZ0hLJuJu+fS/W
         rLVEBVDHVVE5eT2r0kTrLgy1qYceKCCLnHdT+yfCStD5OnBUcrEyWIGEHxz/lZp4xASw
         2mBw==
X-Forwarded-Encrypted: i=1; AJvYcCVZFDwX2Q4Sy0XQZOGoPixaNcGKNNm8VjrM1ZA+fET5+hHJqL1XFUF5LIXr2b0rnhPYimBZaEnP1kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQuo8F80zDIIh2dv4gJ9hm912f6vt/JAQ/cpnm4Qh+Zr5HnC+i
	RNEn7A2CYy9zIGt6+aHzU5TwXSzdZIhWNvYMmOYneBioO1ASQog1xMf1d/qzBX+ejeQZgTGwR5r
	OPdf3si/RgCMlp7XSinpWuC9zzJqv/rubZ5pzwha20ylZkHApKPXfM/kdHy+nmPE=
X-Gm-Gg: ATEYQzzs7TrQ9eVSyjAmGCc99cjKwRu4QxBUL7XwyQegQV6VYhGinh+biNDRtkEX7D3
	KxjSzXvEZbJZpS1lGlphEu8GnW1s+lCXJzYzR5DwLii7II2KZ4Ocrwiuhny9w50zozT9EyMPFUa
	5KcgIxB9dilXzwTn2B/tTz7NNGe0km/LUiNjSwMXni+aHqTreuO72CggnBO4GGXwKkGwoB0d4UL
	QJ+S3fRPXptQlqWDnn0PExbXYfcMkU8aWDlHXHzot2NElzNuD7psvqQvjp/kuXlw6byNPzwGM1v
	OjLO91Dw1CVzLp1tEZ4YDuAv12NoupB6WHiKL+aU5rdn/bQTioaU2p7q7g80UBM9raU6+fhTz7R
	zzPxJD9UzBBbiR6KxUWLGCrXxhEXBUwOdotKMIJe4xXcG6EBSXjcDV9j/5SJQHd8565MqVmPFJh
	y8rcnXsQIMxB3xwcQNPjBh0SMJ3sX2vGEuD+I=
X-Received: by 2002:a05:620a:7118:b0:8b2:e1b5:5f20 with SMTP id af79cd13be357-8cbc8e39beamr607082985a.80.1772263070367;
        Fri, 27 Feb 2026 23:17:50 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:8b2:e1b5:5f20 with SMTP id af79cd13be357-8cbc8e39beamr607080485a.80.1772263069886;
        Fri, 27 Feb 2026 23:17:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11771e36dsm262153e87.78.2026.02.27.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:17:49 -0800 (PST)
Date: Sat, 28 Feb 2026 09:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Message-ID: <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
 <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a2969f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=lcIpdndxgU2EbPpCd8EA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6K_dnGEC7IHhO2Bk1-EjR8MFOWNiBZUx
X-Proofpoint-GUID: 6K_dnGEC7IHhO2Bk1-EjR8MFOWNiBZUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2NiBTYWx0ZWRfXyhTI2X+Q2WSn
 QV8vnf9/i2TNWNArLkeX76sshlmYeYdnXG9sYdnew4C/2XdXfrYIsHgeFa1ry06Ln0bKUhSAjWe
 r3mVK1odXKr2f2vRmjcrYeeadi9NjMdIsdOIVbo9eyQOPA+J9JeGNDYDu6iMYpO16cnoIuI2rRJ
 xqKCMYonnRr9ToCcxfhm+iiIZ/1a0sflwNkZiCJE+m3XMlXPNKWu0T2FTtw6UaE7hkkYFGQ/L9P
 AMgN9DvgmKIxwG/xWaadMlax9sGYahBPxniMCTj218bxg18HmN4Mv/nl2IH+5Y0YKj2NJ8IeScg
 KeLARXCcEbZJ6eH9vNjbj920k4sn150UswITf2WnYSlWlLdyNEyHusM/OeaJ5aOS3R+TRPvDzVp
 XF5JNAGEu6afeFBontMdDKIvpT1d1bMLIUtUqBe15tjwU+6/9u+eZwJ6v01XidILlu+63K0dZi9
 Nzao8K24xhJMVDVBvTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280066

On Fri, Feb 27, 2026 at 10:01:43PM +0000, Christopher Obbard wrote:
> Hi Bryan,
> 
> On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

Christopher, please trim your messages. There is no point in having the
whole original patch to be quoted if you are replying with an R-B.

> 
> > ---
> >  .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
> >  1 file changed, 65 insertions(+), 4 deletions(-)
> > 

-- 
With best wishes
Dmitry

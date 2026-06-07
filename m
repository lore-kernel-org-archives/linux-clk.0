Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070473A168B
	for <linux-clk@vger.kernel.org>; Sun,  7 Jun 2026 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830935; cv=none; b=OI+7cG3jgUdnz7MiC4yxiR3ex9TQygupAtrXdFTtXNJawjo/yWhmvAo1S4/f38cxSsevWg2sn3lmee9A5pS+byt5JnyA/IZ+Q9u4XHPnWJvSnnDh2eX4YOr3zfpxxWvM/r4OJBdPL1xM7ECvvcto58FkwPDnfsVAH+Bk4AuL+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830935; c=relaxed/simple;
	bh=IU878TfwJWjEzViHg7yoM85ADerUxuFmfEEp3heHIM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm8XWzuhOP2uwfRiQ2Ph2JlCg+AJpCE7blW6X+g1D/8p0oXW2Nq+VHJhktxMwENBcWfrxm7HkxQi2UJUzTWx7xY7GxTQnT4bmW3XT/DhQ9zAOcin1bscVkjqO7IHPR/8xSQ0aTQK16P54wyawrsOYrNipU2uiawI9EeiIwTxEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgNotiYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SG8g0njK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgNotiYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SG8g0njK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1ktu377449
	for <linux-clk@vger.kernel.org>; Sun, 7 Jun 2026 11:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQH54m9TrZTMQRynVW84/hWI
	Q9TwqqdJmnTFXIMCgzA=; b=BgNotiYabJwDU67jsdEKqsjHjfHMX39CCvNi/6wt
	seocsNnlcGyiiQaheQFpv2f1MN5OVkp4yOHXU+93rt7EPAl2xDsD7oKQebYTZLE3
	s1eyW8j+9R6iC1ADS5oa8Ni9U4/mwnEjsXqRP8fL7ygA8Kxvfc62GLJg9XGXKKnB
	ZzEC5hPOZYTCmKBHlpXBkoUCe9FQc/+sCumB29fIyjhHQlUJH33OSUUpJEWdclIh
	uOo42c6+jHS0vMea6Y16crDlfG9aQ05yRT/MWt+3X+85QcJNRl2RxaN/6ixwcQSf
	VAEAcfsuMYjLpYG0bPEnkjpfNY/SdgUEbSfS0NPB/Aqn5A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6bkdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 11:15:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so2232169e0c.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830932; x=1781435732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=SG8g0njKVuil/1wfORaH1qtTJVNSUXxQFrDO7eqjJbtJMQ4k+qzHke/XxJ2muFHmqM
         qkxKirSKkhMEeOpBLSVNTX5m0zTX61e49Vi/6PsGIFHewIz/7596okNeXrJ6BDTZN+Eh
         qomL6s2jKQ3jQoMvd8sPP1kaEZUliUwariGKUbWG+WRu68xXRXFGMTBwoz+sUq58tfxW
         5f8VZVSkFvCbIevyRPoNVLLX6bdJfY+bcGEzb/0n8mewpUJ+VxMxGH/kcRJ6mYrxvU1H
         rSJV8OeWRgEfKZ8V7gclGSxrOKRHnOv/PuwtrU+GNt8PxqOzVSvxohAKoXiVqOz0VQph
         WpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830932; x=1781435732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=hGSHp6+UMW7jt36III/DnZFFWxn/LhrdTuj7pP1JoXn7r+QHVWJeygAXON2COXLj5Z
         QfWb1c8FNNtq1BCF0H+ZF+M+f42pQv+Jh6bJYc/XHqjf5sO6nnWUyzXf9lxGYwnyK3TJ
         LqysPkCVU9ec1IdfWsJtsEt1/F6pNx8Qm05vRZdBxaKXR3dUDZLRyowUyBH7DRynL5rY
         mX30fa2SDm7gY9QPSzNvHuSsuPWv/Zsq57ZQpNk3+7oq58bFuhdcsKGe+B9XlAl4248k
         12eVbY0eQhoLlqs3/6tmuIR7luO4ujNkOWi9nAss7ufeWjPGrq16UKLmL9AItoR4E/IN
         6GAg==
X-Forwarded-Encrypted: i=1; AFNElJ+wCm2kN/5WNE1Bj2GU8LurwWQYvs8yA3iPWCwRpRTk2N2EE78oCxNsEO8FjpB+Jf+9ja3pmuESbqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxr7D7+6OcfVSjnK0ZaH5xT3kXvm8Ijvt6A2bnQ1SQxr3KUh2x
	zge6GoP7H0c+BYRsv9JVqWGcv4dNmSzMOdF3u4+QhgP+ZM6YvAyCOnCVahOUVilIwMIR2sVk9ku
	4gUYRkKMTmzW7h5ZG0Zex3ZKSTjIYgtModZcyRthlmRYrUc9Yi7mBtz7+8rA+OQ0=
X-Gm-Gg: Acq92OFFAYtVzTMXsqLcjv9A223nYZUmqbhxj2hX+3zw5g9z31g5oUcjM5YuU6u2cBp
	K1xcGshCWLnXisp/ZliXoE+LM12CV2LnnL5dHHRRgawmr7hbd5gU4R2OKEq1IUd+VJCllNN4IzY
	b07tMyfK+yDe/QmkXCnMyRelQ06G4aVAeD6TukjqzIU/mwu1B0d4ChykcRzUTwQhWLlrp8NDcSu
	ZEGBofWvZXeHNZnurQ2NKvEwQMuTRg0v5l/5uBpoT3urfnr9iVBfKjPX8xedNbZo5Rx3pio3JAz
	p/AR36jAWPyIIzAA/bkBfyPgtYZGCVTyXLjo6OP2nOZkB57y6G63Cu56DLv8a49Bjx4wnSNdkzu
	W3kgxCMZO+RZg2Lx8RYGUN+jouq25SocoP655mI7138rfdVR9NXxEC56siG32fHlofzI5xZykCx
	KxJdfJn6YoYNeYwqDZ/JILjuYksrRMSkCWfMbex69SXf0imw==
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259272137.15.1780830932352;
        Sun, 07 Jun 2026 04:15:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259263137.15.1780830931776;
        Sun, 07 Jun 2026 04:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm38587541fa.28.2026.06.07.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:15:29 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
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
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <isuyh5tebydvld2lxolpx3ukunmzn27mx2pkamsu4wmolnnyp7@defpphasqnit>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
 <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
 <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2552d4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=pxQ0L-axrEwUrt4MK4AA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfX1adQ+Zy7cntU
 9AfN2DNFk6fW8zX4+aYbix/B5qNEaqwMnaC7+dQxBrkZe4WbtcF8DtnHy0mhYnMWxgCX9X5PsPt
 7QeAMsz1RvqXoG9ppbGlBsdc0KysFZU77wtZncUTLuEEpCH/MHXUt/tD8/+ZBZBkUvjRjCzuzUf
 YgylIMIEbfXYaXniK1iFIyDK8GuKWMXUg3wJ4xNOiDRNEA0fxHXpJKuRVb40AIXvMx3p+GuVrMW
 0Cym771OPFXAYkH1qY2yeMmN4nHD7+b05wBgavJJOtpUZ4jkzazFDU0w7/bFwOlysEas75aL7JC
 GiYUcjj3GE4gSrRz9/z5/4uL62S6GZ3XNqb38cwTkuCs2mGJ3nE6YQGgjkdTheF8PejcVykNMRA
 A5LF3/4J/wMrjZ23uJGxGqy8ZczlzGfqVdGmvsS/kQ1M7q6nrL09512Yt6TB1QmNU9V7/dPRTrK
 30sq5KnY67f4lL2QSrA==
X-Proofpoint-GUID: syouHXgcIplrDp5H5lB-R4KlHNnsDe7N
X-Proofpoint-ORIG-GUID: syouHXgcIplrDp5H5lB-R4KlHNnsDe7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070109

On Mon, Jun 01, 2026 at 01:36:48PM +0000, Antony Kurniawan Soemardi wrote:
> On 6/1/2026 6:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> > > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > 
> > > Add support for the "qcom,rpmcc-msm8960" compatible string to the
> > > RPM clock driver.
> > > 
> > > msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> > > rpm_clk_apq8064 for this compatible.
> > > 
> > > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > ---
> > >   drivers/clk/qcom/clk-rpm.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > On the other hand... You have added APQ8064 strings as a fallback. Is
> > this change really needed until you actually have SoC-specific quirks?
> 
> The fallback was recommended by Konrad in the initial review:
> https://lore.kernel.org/all/677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com/
> 
> As for SoC specific quirks, I don't have anything planned right now about it
> though...

So, I think, this patch can be dropped. The entry for APQ8064 should
work already.

-- 
With best wishes
Dmitry

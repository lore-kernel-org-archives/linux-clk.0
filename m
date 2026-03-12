Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7083B6365
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314641; cv=none; b=moKQcUuptECjPperQLnhf91CKCTk28cb0QqFNp122fJ6Y6gXc5/Q7nAXVxDVRVyQDqFmX82zy8Y09Lxa2J7WZ2P+bha6XBVA+lMRuxS+yOsiPQZDL9bEC1SMgxjvb4f3drccPN3tPGJLSLN1cJFW/xMluX5MSEDfayzPwKA8BHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314641; c=relaxed/simple;
	bh=8WtMuG9HhwlWuEd7m6uU9JzaJCnso9USDOfysbX6NT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUCqk2sOERJ0amsBODcnsDuojKNlh6b2i5hQrnqRtfdkpqcpNCff0BYItZO5/ezKwJi7f1wPjBPm+vs0CDkjVhQ+sorCFcQL4S5KSNZ/kw2hVXF4Um0njF7IJ6LNsgz+/C74ECk8XUACaSeApAEhpvIMgtMXsrXHTiqFvCQRpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5jOdZjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eewqqH1y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5jOdZjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eewqqH1y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7eFlE510100
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDZsmUgPgmCRkU6O7+g5TUfj
	tzfRO7LzoRuw6/d7OPU=; b=S5jOdZjPauM9z8SREhIlkxPD8vsbwC9qTQ1eGFyn
	XPaAQ/NvBb2SbVnylA+7MxdN1tpxpYf8Py64199eNt+ReSK2xRV9ihKN1x5u+iKy
	Ziyw/Ak/bcUyFglhuA4+VaHw2qZ9oDtkLS1cTw0qtq+mGYuGerOCXbqPSpQqd/8H
	RPndctAX+FWI/2hgwFChs3VYtJEicVtHCd8JeutwczrezqJWLEev1FhQVccAgNEC
	sAJ/Y3urduzuJeSXyLcsKP5kAhQAwZZRXKjRO01fa0dMljeNLe2LRWm7suWtScMw
	mreq897WAm0ibIdySI4cnvPn/ZDaDhDRbmI0RgboraV5GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w0ju7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:23:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso700804685a.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773314638; x=1773919438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDZsmUgPgmCRkU6O7+g5TUfjtzfRO7LzoRuw6/d7OPU=;
        b=eewqqH1ysT4cZr8JS6H4M4lsQbSRaPN561ozWHx4WOr5gqc4dgHbWElbEAGPf00Con
         SpcUqIanb3ms/OwSlKBVqPX//7yAHs5b8TN3FJytA5ALATeqMK9gP3SitX15tJ9DPzcX
         Mc8EyiZT6MBKcTbpaL1ag8ps3v+0+n3CbYNPzy8mTNbIvfBKRle99u/Tj2xlz9etTRmd
         AEIsGbdJA0cZIEFXTEXYbqyx6bXq9WwwO4RJCqN5rQpqhaXhN1heit7IyIo3PyMVwqng
         vXan+gJsXc8LypHtyP+XnO9oPURani1XCAdBEli1B9dyLevLo+hquonxm8jQN0uzENpD
         FgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314638; x=1773919438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDZsmUgPgmCRkU6O7+g5TUfjtzfRO7LzoRuw6/d7OPU=;
        b=huk34DUhK0UqbG8VVVdFXgGbJEs7P0tKgqSrbf8p/cECBw8vUoAML30E5D3lWfjqnE
         5lasQ4o0ts33h/Tx4riLgMQjAXYNUKs4jWnnCFHGr6Y0rkEFH3nCPOO5n6wDv6speLxi
         R9CtfKlOuoLVlCJrE2hliB4QTqJOuXUXIK7HI0r7JM+NOprNjhyiP/WB+HgIUrgxzmL0
         eqHXIKPtr3fVfXfscrVJb4tgsKMWWYRZAf81Mc+mtn3PhwI6svuBgOc4zH+hUs8nnnTD
         /ol+2WtjLgCJxIUKGN2z0Ai1kGuVSj+Sd0sfIRt16WuVOD1IYqFSNQ93b8eBBoc49dA2
         vuRg==
X-Forwarded-Encrypted: i=1; AJvYcCVYtoPonz1PYSQylx/7+i72cukn/OFLbkUHt+i7Jyp9jky048HjC0FfdJzUdHB8M/FWx4fv4oDbbok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6Ghc+DK2vcHGb9oIJuFI/qzTAzEvRI3+HD8ofHposUZQ9181
	cECmR5dqW8GVvBnnnWEMnU6mddaJ5Su9OvESdxVd/9epSZ2r9urtSFXIyFF1sLqt6+B7L16Yf53
	tjPag9YyDvDNwm5RMZmroboOipOEWZg6gqfYYdQSvzXgGmoTzEy/U8Gea+rSWB7I=
X-Gm-Gg: ATEYQzxXY6O6+t8bh84Dx/QRgSQx0nGd7+yz8D5WeLkxAS4lHLgAJGa/nVIUYJadHpS
	eQx5KA4l4viJ+X6UAsrefsY1hlexI+GlhPl02oNjt+Ipo4v12rjWAfKhfPXa7soGgWvIa+J2VuZ
	cnZg4kj/r20iiSO1GW2+qj3ceF2xoVUu5tgkhUGrGHJOiixiWzNm2VF26d+O0+mQgC/MzKQ8Ufd
	15ITe6QcBj4Yw7yfbWohZ5tYXfyrOEp5xsva44vHFEU2JQiSGNNmogW+ZB2QVy487c2Vvv0QT5X
	YOBnrtg6fVIiNChpeWqugOLRPuKthVUQswjKEpwr0Y2BKJR4ePNi5b5zssi1Em1n1wN18+lQ9pf
	Ilr1gd1ksDGY/rYmsX4V2MNBCJdIoCaCnkw==
X-Received: by 2002:a05:620a:487:b0:8cd:a76d:630a with SMTP id af79cd13be357-8cda76d66a5mr426249385a.42.1773314638089;
        Thu, 12 Mar 2026 04:23:58 -0700 (PDT)
X-Received: by 2002:a05:620a:487:b0:8cd:a76d:630a with SMTP id af79cd13be357-8cda76d66a5mr426246985a.42.1773314637522;
        Thu, 12 Mar 2026 04:23:57 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm279697265e9.9.2026.03.12.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:23:52 -0700 (PDT)
Date: Thu, 12 Mar 2026 13:23:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v6 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <y3h6ufq53g2ml5xjupd4q3t6btkw4jab6wao4pnhrocjr35rfo@rdzi2x3p2h44>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
 <20260311-eliza-clocks-v6-5-453c4cf657a2@oss.qualcomm.com>
 <abHZ8Y3NmsNj3IXR@baldur>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abHZ8Y3NmsNj3IXR@baldur>
X-Proofpoint-GUID: TJvtBqXdBZB6VNJ-xi0MQd4WnJ9_igjz
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2a24e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=jjayl0T0PnkqsG75a-cA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA4OSBTYWx0ZWRfX2gmyZvly+4L2
 KPBHFZDihazcFTNA9WLkDD5iIYkjhxRhvxMdtrzSbMFYaTn5MIGilrA53Mec64dCx5qlxZ9lz/h
 4TxA5JCyviZqW1XQnzT+zLVFk8L2tpZ7E5trK9jt5J9y0+IIPFJSVChwn3Ll+EZ6bYLHBvBZqKQ
 SG79Q2aDLscoXqNUbF+j6uFA9LE95mav/xngQOpRYuP76Vxp9laZx4fEHuIfYLO6OIAM5UeGgKy
 ygzOqjJMGJFacp+6UbkSIrI2ae75OlLkT3+FqbN4yW5ATvH9dlieZWGZV4SnHlV1GRYCG/EtqSo
 63I5eGQIBf3jeqA+Xs37SaLiBCzRxw2YdIeA8fTUUDBYSGmVc73gYK5zZ+Et4ZxwP+DmW99bMSp
 IcPZe1wRAKR3tSC2GDNIb4IvpHagHIYTkheTRAXnaK2ZoDbFkNs9q1O5mrhmpwe08DR23EQ/44p
 FDXnnH3PgjBPyRRZ8+w==
X-Proofpoint-ORIG-GUID: TJvtBqXdBZB6VNJ-xi0MQd4WnJ9_igjz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120089

On 26-03-11 16:11:19, Bjorn Andersson wrote:
> On Wed, Mar 11, 2026 at 04:46:35PM +0200, Abel Vesa wrote:
> > diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> [..]
> > +static const struct qcom_cc_desc gcc_eliza_desc = {
> > +	.config = &gcc_eliza_regmap_config,
> > +	.clks = gcc_eliza_clocks,
> > +	.num_clks = ARRAY_SIZE(gcc_eliza_clocks),
> > +	.resets = gcc_eliza_resets,
> > +	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
> > +	.gdscs = gcc_eliza_gdscs,
> > +	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
> > +	.driver_data = &gcc_eliza_driver_data,
> 
> Don't we want a use_rpm here?
> 
> I merged this for now, please send an incremental patch, and please fix
> the tool that is used to generate these patches.

Sure. Will do.

Thanks.

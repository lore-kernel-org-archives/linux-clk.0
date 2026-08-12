Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1E34B1A2
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497688; cv=none; b=ejIYh8DfkKIdpQ882hQgJ/1AxA8H7Ge+n86TzLO28IAlbZhqDN81I6vKJVdMkAQ5tOOQIGuRMM2+V9iPOqVVzfo6plMRWEWSY3IH3DxlBHFRHsleRqyozdLJ29KM+zXiACPyJkVl1hozRzOH6CKZhs6QNfnXr9T6f8NLgq+Wkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497688; c=relaxed/simple;
	bh=9UYl61WOmOuArFng3Xrwkw7uxon5EPQbUBcRNOj54pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MStGoI2dgqi0H40TsS2DUoIXl1j+82Pi2ZTftn9XN/ibzgOs7FYzUI4Ev+5w02dphgDh991/B6Kp/rX1T9EJcolbIqqL/nuoa1Y8akweTZTx+wwdryDoz/zHz470EromJFkZE/Sy+v5Yv/Ks1S/7TcEMgRpNOcuSnJDq+zoIFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icWBn7Aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0ny01Vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icWBn7Aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0ny01Vw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BNGebx1706221
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 01:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5a3XBzcMA6vkW7LRI5Be/dhO
	NOD7PfEohmvAk5RCvEA=; b=icWBn7AjaNso3Q5fLbRB60DIvvB4jGkoxD+iaD1y
	HsoPnruWyxwSx0LWxjhJyQZL9zY4cRC+RefHozoMGSUbLZZOL01rq6BsNCpZqvTu
	535BhWfUnxNbop32+0SCi+DPmNeHZMHN2sD7UseyFJBVsMo/lIlUZAK6fbkgyoiM
	Z8qsjhSW7cTAxDK/6E/gdaNVG+BDJdpRJSzNU+wg0rhzvqwnKBLRQpXpbVBdKcbb
	TffZjgB2ne85pASICW94OvfCOwlDI3HtzLKQP8eh4h5MKflMeyWnscVnUOSZidnO
	ggw2S/dW7fPz45aUG0BW+fAvCK3fXqIwTyPEFRIE1QzUYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrhf3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 01:21:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d122bbc621so14926645ad.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786497685; x=1787102485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5a3XBzcMA6vkW7LRI5Be/dhONOD7PfEohmvAk5RCvEA=;
        b=Z0ny01VwH0G7nl28K8R0UMnxhrXFZvsq8I9FLJkKkbho3HmEypcpI7AAgJKO3bXctc
         sVniy3ORN79ktKnLmCoobF8W1Fx2S+vS3seJoFtkh8wOPJ7Sc1azFO9omfxk9XHM43+/
         lStbr/3GfY95K4PfE0PkT9NIQM5DrGI/dW56asXNKf+vn8ueDxsCj9L21NXq0gxFamAt
         ZZHcTkJubuHUbB6Dm3/jB6ZG++lCgLGWgs4DBioEI7WmqAs00JQ6pbkpzWDk4GPUKAPR
         8MWnsAb+Q4uEZuDBOuc1DnqFBWi+P1SwJVyfajuijfZxxY/gvCyVcb0FE21F8rbaCapa
         0SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786497685; x=1787102485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5a3XBzcMA6vkW7LRI5Be/dhONOD7PfEohmvAk5RCvEA=;
        b=hlYYhkDyqLautRadj8Ld+W8jChc3C7YIfMotBfwoyQwBhsEmMxKN8XfQBoL6tkrDsD
         83hsfRryuxRhAr44gBQ3L27rM32A9/bxSW2GkBIp6aTF6W0sLEqKdpgxtVnY2ym9WKO0
         obxU5SatZZ6SnCnPxqro8d57NoolDfVR7Ee4n017nxEchkyRJsCPXyqh6epx/Z+4i4I2
         /3pDF7OHnkolcy6jAqYFsinQQ1UVco+GLljlqEiBcJbIr9mAKxN9YLE5GhvrsGA6LGI2
         0RwXAmfBxKafqWWEKk8uyAwgBX2O6RHLIq208UnOXm4Y3fGZM4UONNKrMKk+whX1YwKR
         hMjg==
X-Forwarded-Encrypted: i=1; AHgh+RrcrRbaMr0UNYmDGMh60G7/7XYP2ZhhWWnZT2qrjIjrh0LIh45fL9HTwg3wuFqzXFhqs/AtSFmaj/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoFDe2vZ52KJhHFs+4p1R2Qt3RoJXQXbah3phxQ4oTrN0yiy4
	vrY0s98Ak9uGJAtjyPWLO+3rtM78NFYJNmzn8qNput4bYNAIvtIXvi/Ay2W/IBiJ/Z9faR5YkHj
	KWulIcdT4i0xI4Wr7SS/W4OjkBYJ8GO6Tx11T6HmOdJc8JwEPmOaVnhrV9gyqdow=
X-Gm-Gg: AR+sD102z2ZpQMNY5DyjIhgVN9ZHortryOC0WuzcrH4K0ARTLNzBTSClV1S6ZpJlnrf
	OiCfEVcXU8LRdQ5jR3BLCjstgE8/ZcecmK2KTxjf0hSp2qyjFJpnPLkMysQ7ZEp/wgLBLVYBkEj
	+oJCUpqC27Ay0tkyhNKB8Kvf6ms4ryV8DNJBn5ePP0YwtgJHakLUwC6uj/Gu08negagD5Gj4yuT
	4M+BksAfQ/uNMht+5vfmHsGUG/phJVMILqi1j/ue4BivBjD2mI2ggZS9f+vAHlgL+iqsMGCRrau
	ktmDRJ1wmHmpZ8WErm8rZ4I1c80frauZT++TX8jIhEgAvOP5rIxieIVLqISTh2eZ4/uDWE4RIkG
	Vw0N1w1B8ebhnqZ+iPLv+MxFB74zjiRRHrF0grXIzbqgsuOyJ/Mk4qw==
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc3f5cee4emr1257765637.13.1786497684835;
        Tue, 11 Aug 2026 18:21:24 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc3f5cee4emr1257699637.13.1786497684277;
        Tue, 11 Aug 2026 18:21:24 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3624c6dsm5983243eec.4.2026.08.11.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 18:21:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:21:21 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi camera clock
 controller
Message-ID: <anvKkfkiWEGk6ODs@hu-mdtipton-lv.qualcomm.com>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
 <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>
 <20260807215046.GA2074060-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807215046.GA2074060-robh@kernel.org>
X-Proofpoint-GUID: Ll3lcKOc5nFHlR2PVavU3ch7g_2GDE1R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDAwOCBTYWx0ZWRfX04MUiggeM9cO
 aEeu4hOf8vh7poug/33pqBcgx60qDIT3cYvV/Xrxs4burIKBFjuZdExMoXofJDodiZt4NyLsgCH
 sJZVeFffY9oOCNTospaizDn6h5TGdYc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDAwOCBTYWx0ZWRfXzVFYeUo4+cd4
 vNYBTBCfDNo0Vw6oK73V+eK4XB9rxq/Zg9GPF7Onf+UXWdbwt76lK0V0nI+af2xIp5S7z7oTOds
 Tao5jpg0uhbzg6e9nfsuy+bkFL/4TvTkPUg12gkVHfrGjoLADu2aTKwfJP8/csoUj8K3lnMLpNc
 pAl5Pd9xENQAax4nAt++CRKnbNPppFdBLZred+GApS6rpBQPIF/YXpHQkC6ufVBnhWPkP7yv2Zl
 TpMp1iuYHETG6NAgGZmOOfRKtztDk/9YMIE2vD8337RZJ1/x89HCmAaZ2woxPMk3F7rdmsoTKRd
 T9I+C/45/Bz6m9tF8vh95x+TAgbcTQzxZBXgi1czHgJXNTO6aWg/JhVVb4VBDqHBmf185S5QV0u
 MMQ8yy6Wqz9PF/cd7P3Etoqdx2YQNRZ4qWjBw4TPd4GO7QD3v7gJ/REuudDWkYcafuFo+35WGZX
 SFYUBMS0ARlMnNQeF4A==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7bca95 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ln3hM7--VPYWvVz1xlgA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ll3lcKOc5nFHlR2PVavU3ch7g_2GDE1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120008

On Fri, Aug 07, 2026 at 04:50:46PM -0500, Rob Herring wrote:
> On Thu, Jul 23, 2026 at 02:38:57PM -0700, Vivek Aknurwar wrote:
> > Update the compatible and bindings for camera clock controller (CAMCC)
> > support on the Qualcomm Hawi SoC.
> 
> That's obvious from the diff. Explain how the block is the same or 
> different in Hawi.
> 
> > 
> > Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8450-camcc.yaml          |  36 +++--
> >  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
> >  2 files changed, 192 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > index b41247b257b1..cdc19418c064 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > @@ -16,6 +16,7 @@ description: |
> >    domains on SM8450.
> >  
> >    See also:
> > +    include/dt-bindings/clock/qcom,hawi-camcc.h
> >      include/dt-bindings/clock/qcom,kaanapali-camcc.h
> >      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> >      include/dt-bindings/clock/qcom,sm8450-camcc.h
> > @@ -26,15 +27,21 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,kaanapali-cambistmclkcc
> > -      - qcom,kaanapali-camcc
> > -      - qcom,sm8450-camcc
> > -      - qcom,sm8475-camcc
> > -      - qcom,sm8550-camcc
> > -      - qcom,sm8650-camcc
> > -      - qcom,sm8750-cambistmclkcc
> > -      - qcom,sm8750-camcc
> > +    oneOf:
> > +      - enum:
> > +          - qcom,hawi-camcc
> > +          - qcom,kaanapali-cambistmclkcc
> > +          - qcom,kaanapali-camcc
> > +          - qcom,sm8450-camcc
> > +          - qcom,sm8475-camcc
> > +          - qcom,sm8550-camcc
> > +          - qcom,sm8650-camcc
> > +          - qcom,sm8750-cambistmclkcc
> > +          - qcom,sm8750-camcc
> > +      - items:
> > +          - enum:
> > +              - qcom,hawi-cambistmclkcc
> > +          - const: qcom,kaanapali-cambistmclkcc
> >  
> >    clocks:
> >      items:
> > @@ -67,6 +74,17 @@ required:
> >  
> >  allOf:
> >    - $ref: qcom,gcc.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - qcom,kaanapali-cambistmclkcc
> > +                - qcom,sm8750-cambistmclkcc
> > +    then:
> > +      required:
> > +        - '#power-domain-cells'
> 
> This makes #power-domain-cells required on existing platforms. That's a 
> separate patch and needs to be explained.

It was functionally required already but was never documented as such.
All the pre-existing "-camcc" compatible devices register genpds for
their GDSCs. And all these camcc devices already include
#power-domain-cells properties, so this change shouldn't cause any DT
validation failures (at least for any in-tree).

It could certainly be moved to a separate patch though. Hawi isn't
actually changing the fundamental requirement here.

Thanks,
Mike

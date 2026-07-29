Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F343B3D2
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312194; cv=none; b=c44yYi37dRMwi6Au6addCi8BicSnY/0nbD8r6Dqib2SqdO5rroif4wfuvDk7cnJRLqapRyoV6SFuQYYgyXTL11Y3MMl8/4e1ePArM4zSQz1n9CaQYSYCBWtna7WjbAS/O7BzyXAN8zkg28HACNToSi4NHD6RGWwbP1YgCBbodZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312194; c=relaxed/simple;
	bh=VIXH/4wp7GDGEjcN/n0qLhwMWfSkC161PQaJIB1mta0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilAfMG+0FehyVihXsIemudktaUFZ9ikDNk9syQGt6/6Gw/dzeISTDrw2lNdX25tgQG/Nv6vFzSCVxFQ6GO6R9BtQvAkLEEK1pptMkT30z/IPCEKztOYmz3HzrKzW3nFcZbohhWAIhcEjWTnYdfp9tYZRBrfbBOZIgH14d4WxaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYQ+Wll5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XowlwIL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYQ+Wll5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XowlwIL6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ewec1340667
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lBdzh8bRoeR8HuofUs5c1Q1
	lfWDYRIe765m7EVTOgI=; b=DYQ+Wll5//7/3bfEluNlFT0s8RNE1i2CWf/EqOTF
	JxOoPGqLAWPz4vkAFOPqHavzKLZb7EZBL4fFhjQgzHVDAcwKft7c3gQYWzVAXbQU
	+y/yVbstWDdGviq+ITbmwCVyhl7BXKzIA6MucRYLD1EXzkCvc3lgjQ6mw67sdNk0
	490Oiv4DSDGWs7YUW641jFQeIxEPtEaZf1GNj/n93YGkScmOmDfvA/V32UUI4XUQ
	4b22hk0BRvIU4uz9BIRnstxnsEto+mLX14FaUf+HFDwMIYaB9BiTywPV40iUAh14
	e+P7Umxp2YKlybDralLgO71es+oUTwuu6cB+GoBhzg6kUA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6txpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 08:03:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so698197a12.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312188; x=1785916988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lBdzh8bRoeR8HuofUs5c1Q1lfWDYRIe765m7EVTOgI=;
        b=XowlwIL6TLJ4N9RW2RzfFlPASbqFISOou7A3RTzLatUjL//ATJFKs56DPIVMCBWnzU
         tI+OyeQ1VH6OICH+xXbpFqwwVmA0mPW3+6028jJHKyALXkoG/A0QkkQTJ55FCzjSFWjn
         TKvzDOzYjkeEgd0zVTvhUn2nAN5E32zd1Yc5iRVi6IGBcQXX8bX2KjyLCmr/d+F1t9Ih
         hV/l73dpNzYIC8Q1vqpvSO4Sq4u47XKfTIOaN1vqEyteGDl3Yyn0qctXn+IxwdVsRrXR
         OyqouGibawpwnFcV0gMZvRaQgZI53t8u/d7TuM2RCPIqftZ6UhoMMvqHbdI6atu7lA8a
         l7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312188; x=1785916988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lBdzh8bRoeR8HuofUs5c1Q1lfWDYRIe765m7EVTOgI=;
        b=IwuO6D9tp+O2OndsHSe2UmSlladq/t6upVLy5SPRO/BXb/30AWHxcWq0MhTsOpk53T
         s9f1mpbA20gYxlGXUWfIRVcV8EzHALCS/+O02L0p1mb5sB/7rgVb8/fPjYGjQQPJDTk+
         mkvtD+xvmWXuNV/n6jSykpWm4VmmC5zcmjwzNChMWWCFFeE7roXxtn3VpReu1BxdpDnF
         BudE6Yq+kWZSwdqT1ZFb3AJs6M2da0DqCCztfAlST0VqCubbxFYXI1C7F7c7q199n7fR
         zDIWjW0dMFBpgySnHTl/sSbFvm9bflA+ODEdPks/Dksb7E+f3oYq+ob/jRF1HY+4hUDH
         BjSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXh9/cpTtJjZ2chjmtBI4QuIKVw6YcWS1RXErZrqAiwA0RMPzjjQlaiU1ge4JpbLQrfi4a8n297yA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Q7504W4YGPOvs3MSXzmi6DDVIgPejGug95erBfEo4D6Fd8ed
	JOCf5Zcvvd0sK6aMgMdh/oZWzfjiYd14L/xqnGQBB5iaOQ5PRjaUJUK1Xfd0uQ+POv+/UATdS1M
	BNjIE69e9QKOhHpWZtJTewwGi+Zv1icUCjAmAyVSlMqEfHqL5oBdvChmn/aUx69s=
X-Gm-Gg: AR+sD129HvewlIme7s2bd5rEYm509xYCDo/Jo7dCY9y+XwcTEBRCgOl3vf3iPZJv8QM
	W1Nw8OuAm95twzI89nPFobeZtuJqWDhZa6/pMwsBC86t7u2c0KJttsGMpyUeGxVddRk1vU3Anbz
	qAw6EeLoioZOVYX/UtGmih8qNS2SGoFEuH1LhjTHH45zVpWT5+hacUKrV1m6VN+4WFSyvspc7Fo
	fbdzIHBbtKLyTohs5kY/voUkGLhOwl2CtO9h90SBp8A05Lqw4+QAGsA/i8ZQFsDO+uQjTh1HcrQ
	fAWlqIs7otAX3Pot/aMfyyXRXJcZzfNc4HvRwCkO9ccsSQAdvO0AUSxTJk29Z7e5SVtWFNHrHqb
	jOWsl0eaCyoLW89XjztLngpIiZ9da8OTzx1VqYoE9kRcP6o4=
X-Received: by 2002:aa7:8c18:0:b0:848:7bcf:9a9a with SMTP id d2e1a72fcca58-84ea7949e47mr1014505b3a.1.1785312188103;
        Wed, 29 Jul 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:aa7:8c18:0:b0:848:7bcf:9a9a with SMTP id d2e1a72fcca58-84ea7949e47mr1014478b3a.1.1785312187664;
        Wed, 29 Jul 2026 01:03:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3182sm965815b3a.54.2026.07.29.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:03:07 -0700 (PDT)
Date: Wed, 29 Jul 2026 01:03:05 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Message-ID: <ammzueQdjCXTOMUH@hu-qianyu-lv.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
 <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
 <20260721-tactful-cerulean-shrew-120a9c@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-tactful-cerulean-shrew-120a9c@quoll>
X-Proofpoint-GUID: dv2IOpNLNK03edCAb58805vpJk1RuO8h
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a69b3bc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=u6tME7obI1wO0-EO1nUA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: dv2IOpNLNK03edCAb58805vpJk1RuO8h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXwF+7yziIvW5H
 RKCd61qqdG0pXPnjPGllLHn72++0bgOZb0Dmg38CfSBbWGmGyY4Qo/pvZuSlywRetNH22GNdguu
 /n+DxscueiYYQ1GTpV6G3Vltc/V7zOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXzf6PG+myHxTW
 7OVaKJElyVMSmorRb9wL6X+xXENwD3e7o1mS4YVeGLK+w+BCkDezIOglICmwuQkulfsLEkguf/h
 sQPVP0nnvF9wIQHkz+pBF4BPpPN2tRao/2hxQnqOAwiPia9Z0UOkMcyJLC1BltkCk2xCyAojcLH
 UrdqeHCiesgEVgrXr+RTSGP9eZI3CqIrgS0doznsd5hccaFhElWyxbc38OEGp5vc/6NaJ8qqxJz
 13pGLxt4uz53a4OgKfO0IZwAXsfAfolBPNMHBEt43JdrkUDvF7UuESQSq9cWpJHTFxhKQWNFF39
 5JiD9ws2t/1kW3mHU3fdLHpVKiq2iQAMhPs5a7bkLqEVw/bjdTrajXFH6iJ1/UrLuuSsGuBdM7q
 KivgWYxrmYMUes3WAqONyotVE9sxT0PU6+v0epiOsGPlQXzuOTuJzhrwxuAWyyNyIzktj3fRk8d
 E/EoLAPv5SHQcJDv4Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290064

On Tue, Jul 21, 2026 at 11:52:52AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 07:40:41PM -0700, Qiang Yu wrote:
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - vdda-qrefrpt0-0p9-supply
> > +  - vdda-qrefrpt1-0p9-supply
> > +  - vdda-qrefrpt2-0p9-supply
> > +  - vdda-qrefrpt3-0p9-supply
> > +  - vdda-qrefrpt4-0p9-supply
> > +  - vdda-qrefrx0-0p9-supply
> > +  - vdda-qrefrx1-0p9-supply
> > +  - vdda-qrefrx2-0p9-supply
> > +  - vdda-qrefrx3-0p9-supply
> > +  - vdda-qrefrx4-0p9-supply
> > +  - vdda-qreftx0-0p9-supply
> > +  - vdda-qreftx0-1p2-supply
> > +  - vdda-qreftx1-0p9-supply
> > +  - vdda-qreftx1-1p2-supply
> > +  - vdda-refgen0-0p9-supply
> > +  - vdda-refgen0-1p2-supply
> > +  - vdda-refgen2-0p9-supply
> > +  - vdda-refgen2-1p2-supply
> 
> This looks like ABI break without any explanation.

Okay, will add below description in commit msg.

These LDOs are required by QREF to provide a stable reference clock, 
otherwise the USB/PCIe/eDP PHYs cannot work properly.

- Qiang Yu
> The dependency here makes it also non-testable by toolset.

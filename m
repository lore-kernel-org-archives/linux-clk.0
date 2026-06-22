Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A96F379C57
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134697; cv=none; b=i/hcH6KEdjsHgEG4lGeKWpTBrm9TV/iJJbXqa6ptwwkaq8llpBgnBLs3gxbQz/xrPNDDleY6RcOfM5bSe5Zy9nvCgkyp8MmfaM10LKFvTqppRBtOvtPD3XqCjlg0asKCnt7xwGOcCytvJKveqqonkGahXqv12vhaVNQvdpPMx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134697; c=relaxed/simple;
	bh=Lj/oVPnB/95Wl7MnqnPwuq5mYkRXjp3lzUWb5YjTH94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnFCP9a/Wy5YjqOsVY7BGcT+nPKcAFu1Rm8FoAm3u1F4M/3mDX+PPou71N9UwH9zVt1N6EgJtnVBTMVb21SPjqsFkQdSBENErGjLGN/7vxiF6QDGgWyssp+2lQDQO2XxGhz2nbL/b4NwIrJu41fTDTTuGz2VnBX+ofb+olMrHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn26DHZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvNfCssa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn26DHZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvNfCssa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFjis792460
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EV4Wemo6ixakVHZXIVFrt3J
	dpQFipHlrf248A8xxAI=; b=jn26DHZE82vn6utMVr+2DPgeFvhX7yTZF2cXVepS
	Go4loYhPC6IjoEjKJT9N1U7POqW8RLF0hP6kGCfeAx/bhQctxj5u6YjYiHQ0zf8w
	LHkLgFm7bTBvbpNsTOF2K5SDjpdES46cJVldf3RlXdIesmKSNgTPA0Ns+MQl/G1m
	KJcx6CsxbXlDilH6hyUyYj+LNgwiT20BvbDWQQ9EkHZOFeVTE1T0r04ecn6RJCHk
	Y4IkKy4eB0n85J3f0ohyrhDnQgl1jWnJI+5UxKBdfrvgp4OGECbew7W3l6pAzp+S
	JVyyeGtWSsoUAS3OJc9gzdeKRtAi+Vf6H/VWyPWFkr9a4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq0j6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:24:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c011c7cb9so13386809eec.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134695; x=1782739495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EV4Wemo6ixakVHZXIVFrt3JdpQFipHlrf248A8xxAI=;
        b=VvNfCssaNzQd1X3JQqic3lm9+sDo1RB8pcwaNULodJxn/lGqwY4W06k1V9hHTQiISF
         sfqTlCt2gy7yQ/99zaVpHjLLxCUpgbxdCGUv/cP6/f+7vK62IRf2KTx04BKlardcRDjz
         1MYmfSh9qukBSsIeHjh5WW3jw6PdQnsIjhSuOnhluZin2q9lq2ndSvnaVGBv+Gq+A5L5
         enstYhbbdpvZdakQoBauAi37dqgPuGwGIahmvFI3xeWlq4j+WsI5VC8+aAPZd8ZsJSJ9
         o2LoUiuQzwNv6EMvBE+VpohfeCgsJCnFspYhQCkgbFiKzpQ5ZksuTh5ykKYwHmo7fc9L
         U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134695; x=1782739495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EV4Wemo6ixakVHZXIVFrt3JdpQFipHlrf248A8xxAI=;
        b=mxByWYO61PKoXGVNfXeYTAB1osySyJcG9leF2/sIaV9BQG8tsrQpFfIR+CjJqGwY0a
         mgVTtLqgMFN5v+o6/n05bq98rcW3U/BIyjAegsIIBg3S/SmASX48p1NPn3iCZJCTT4rd
         TQhJxtBTbcdPIRcxTmLNnSTWgu9VyDkKmG6TzzQMXJFbtESrqMQx3AeyFDvsBp+Woz3W
         33+7C8/3R7+FXdJVsr3mAYuF7Fk1JwFyVsX4cCo7otDOZAoDdjscPbRVz+UGB/MuVe3K
         FUySoYQbFbvyk8emejcZcAVriJMde3MfUq44pZFARpviISzRZeh7CmYgY2LjriMvfZPt
         QfDQ==
X-Forwarded-Encrypted: i=1; AHgh+RozegO2hCvzatHipIEdNk14BEAp4l0aS0Dn2qU35RCpQB2joeIDuGctsHvgD+/FIyMN/g5cZFmy5TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFn4wv2wEThnA2VRivjt6s9PT9sNWrTy6UqlshP4yZFgeWGlId
	NWVfvyPBcHoojtCpXdABTGkq80zhc1cKdjZf2jtA/olmKkp5wbH8BYpJu8HVunrL1BB4lbMC05x
	kvL1BeoYsoqNPBZV6gAcRy2P9kdz4CO0WvLofPA2GNzlLUA4kvsGdgGwAEVrffhY=
X-Gm-Gg: AfdE7clv99PdgqyGKuGtmI2FHTJ+x6TH/RHD5H1fHrlUl4QsbOg9TTASUOc23pqRJvo
	js2ezW9c4RY1/E5rsb+8lM6C6rC9NJJCh5UJHIwyeVBGhFxnIc63ITt1MXzZgclhAD53OY7WDQb
	EiCorX+JXYbuXX95laDEPhDNm/ZFpzx3/ywOMKYldu/0sNh4k2INOWBRH3NUS9GUHEDQEVzMwKA
	N0PbZ3y9D9OHmsADYByEhqY3DTlguUyNK61R0CqPY8qHUc/Ulag15Rdqhyt/40wV3uWDRslo6QL
	t38dvFqWMCtKrRCCPaRpXM+7hPTSFIb6bHOAn/XY1SCI2BHG6crOHiRsqE74WMXZ1UHlLcDuBSc
	3qaYI5/Ms3epUfChA5TbaSGGM4pygcdHv9I+xCbZ/Bm8b2zv81h1O5gy/MQ==
X-Received: by 2002:a05:7301:fa0f:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-30c07006529mr9940802eec.20.1782134694902;
        Mon, 22 Jun 2026 06:24:54 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0f:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-30c07006529mr9940762eec.20.1782134694241;
        Mon, 22 Jun 2026 06:24:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c32csm11113098eec.6.2026.06.22.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:24:52 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:24:50 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Message-ID: <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
 <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
X-Proofpoint-GUID: Apv_8BhZd9HeQuwz6ay2XJvJtlvSrs1M
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a3937a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UxYOzgASb6pbHj99R6kA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Apv_8BhZd9HeQuwz6ay2XJvJtlvSrs1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX1HFpro7tA3hU
 mJGj1mIGBkgxhJ0w7Lr+rX9ZAt9MpF3BPAN/ajbgIo8OQDMMNLB6AAOpu7fpDUMtmiWBhnw7aDW
 U2VZKeh7Qycs7XZ0YCNT5Kzk4f8WNuWNB+XtNSdbbC/BnV/+6P+TEY+MZvai89jhfIb97AdlYMZ
 YfMO+Fz21GmPi3YA0V7pHxpN3qx1ZZIpl1VSpfSUHu9wdvdEZbKRWzcLQ+sutBcmFV5lYfI5Ncv
 EYhB1kynm2xRLMFa8NyJ8fEGMBDqTVUMAUTsnx3if8WeNbi30qrjjefpElrOPl1Gyvroolbjw3i
 Wr2N96j/dFlGDZ0mhijlzI/S8QeeSDEL7lI/Ddxg3JYvS+a14SZ1ey1RHM/WeVaTazux7ZZHoBN
 nrwUbsYsbNWHTw586dmmsefs2NyGECu8iViAWITz96TzQt6z1JB9XuyY1fI1OT0L0rUeQIVTGf/
 SIaSHMwLNRT2BHvYlPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX5bSZJPxt69BF
 PzAN0jALkab4q5n7/OjuQ0f654OV9UkZMoKuHlmOlceFLTQD55DfGEGqgIqUPUZJMwgOn5DZLwi
 BoMHLMeCciNkqyHJaQApjIaKNFtV1Lo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220133

On Mon, Jun 22, 2026 at 02:16:45PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > The TCSR clkref_en clocks gate the QREF block which provides reference
> > clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
> > and refgen blocks on the CRD board.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index c98dfb3941fa..92b929ee3448 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
> >  	vdd3-supply = <&vreg_l7b_e0_2p79>;
> >  };
> >  
> > +&tcsr {
> > +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0

For COB, it is l2h_e0. L2c_e0 is used in SIP.

> 
> > +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0
> 
> > +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0
> 
> > +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
> 
> l4c_e0

Same as l2c_e0

- Qiang Yu
> 
> > +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
> > +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
> 
> l4c_e0
> 
> Konrad

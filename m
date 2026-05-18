Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AA3D2FE0
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089189; cv=none; b=TiU9jgPIENdwyWJnCujXdmuzQm8jBLGrQNXpYU6J0ZShoq/Iygfnj7csJh0961SNhgdvf79xtW0NIRnHUOZNSdLWxTYnCoUlk5Cv60ht5gYNo7dOirG0MkDJxHHt6mdwOD1Z1BgHBhG+E1MVxOwOQ2BApvpmgzH6QNeozmdomy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089189; c=relaxed/simple;
	bh=BFLT2sMKZVbvrXzaGurqIbvGSBIHgB35MLJgnq7E054=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0N3OIuEsgo8qfzkkLK/jW5WeacbSEgO7puNCO17AG0OE4w/KiU1EK84xVoLcyuRoKp+XoR193ojWnVWUBwtpaVamUF5+lJjriFeQf/Tft/tBk+8mm70KKHdMhmr0d9qbSRE8wOSZ3WOdVRAtef1+qjrHxs3zfgUVVQvde9mtw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOYl2Mf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwXu6YFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOYl2Mf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwXu6YFi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6cr1s483452
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 07:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ucnoUt5TTho0FOav51RvQTc9
	B7fXpvFXnvdL/+fsk2g=; b=eOYl2Mf3VfMDvFaerDc9SCzd1gBvFRuDITQcohz5
	6t5QHpVpBFByOB1X0GPjhoetdosfqcmavX5R08XqgTwjptGQzM8J3jtVHZ05H9mF
	wIp1YwQkQzbCCiFEQjkhDhmkk8M7JM6WkoXLmL8n62G+oXRd/fJCSC4lmqp9Yge7
	dTHdLO37eftCvwm/v+vV/pSSl/pDIFTlfLHSJJfRg1/RC5Er2RX0kJj27z6F5ffw
	lqO1va3I+G6QHJ8vePelu9TnunaZZuF6FHR3COFL3mFeWS/pFr+4d2Bz6ZCAMF15
	lMLwJ9xkSzroIUOXLDaWogIJR8aNeWOCWcRzJ6g8agYVIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcm1s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 07:26:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef62078ee7so2734561eec.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 00:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779089187; x=1779693987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucnoUt5TTho0FOav51RvQTc9B7fXpvFXnvdL/+fsk2g=;
        b=XwXu6YFiFQV3fIsKJfILi0KbmGg+/piTnFRyOCOK78D/SeozF43/M1AL4VryLQSWGk
         AsCMr9uXawFbwxNjZd6z1svi3UvAsWDT8B2B6KNzheYudtPEItpI0FobcFq6TL1OVDi1
         nVxKfo54oR5oHxQlS5OCnyHK8YLE3tbwsGCiLIy0eCQHZiLx053Hc3RpnkACq/Dsqlqq
         mt9V9MavULd4GDjne+eKLgiRRwjp4QpShnHMPMyK+ZNRS1iqTQT8MB01vZV4TWLstuGN
         5xt7MJRx6de+eNGQzLm9JX6h6M4DOuURD5fuhKqpTb28X+V56VGNEcmpE9/5SAmbLh1u
         dkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089187; x=1779693987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucnoUt5TTho0FOav51RvQTc9B7fXpvFXnvdL/+fsk2g=;
        b=K2u3mYJIwZYdDmQu4y/882Jxg5aHyuCvqWRl4AKCEwXJS9kHucK+5dXnnDb5MPYuAl
         QhJBiJC4muO86afIVQKpju1k+9xw2mqnJ+WNPRWxkrLZmOdZlG6XYRZAWbElVFfFWr8Y
         0Ezx6rbRfRNufbI7PXBaPbkUve1aTiH6ossWV0XaVVsUg1HB3DxVjhxrmtb64wBfZwU6
         KsW2qlXnTqFNUAlHTgyGZTymRkzW6fItTeq9SU4GT3Blew5VvFZBsWu0ydzdWRUZKBkP
         HzPAB6IqNyH4qrUHPK6wcaPr7QWbMD9MybEzuxQjScGPKY9wrNdZvPNzv/dtChzSpM80
         9RxA==
X-Forwarded-Encrypted: i=1; AFNElJ/fbsgOAsEl3sIdl17dO8l9HpXJrwS1kSJ5mJCLK/4LJWIoX6NcMl+3sKx3M6zHWqROPCDDwbCucsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPdLEkLgqeMwqbftO9YnMAsSxowDPVDknaI37DFXlVJd6I1dv
	iaek3NLSddAoEIHD1ZELxlo1d8b2RcZDpBWDNrFC5GbEti4+0ZHZPD+RbNhuW4KA8kUE02a8Kt1
	SXbETsB0l0Id6lvBtkXuvPb4UwDQ1vDk0SXUhPX4dS9BqCT3OERzGYOpnlg/JWFAC6JLdjj5wnA
	==
X-Gm-Gg: Acq92OGVknx7/EAYzMCSYbIc42x4vu7yKHsbYNX6l2faL54b6jH4POqs86UhVnaDjyb
	WTdjL9n1Uvv7Fbxkz3mVwuYZfEOyicmp68SZrya88Rbxj+8FHYcPYZLZJ8gWm0Mq0eKvToikeQF
	hnPhbpgUjzuXTWqLPhArTjKDRuCQq1pTjOsjf7KrYOlzW/2NJvwOMSM+zslAusiyLpTD0g2CDfV
	u6fqWDHtv+AzWsfjGKh63Nx3qHB8ne8IwEr+S2IwGvSvIfnhJB3O0D/fIDDagZx8kuakiHPRZWJ
	99ZWw3vqr2y0bhyUntfjPR6RV2I3mZII4wD/AAGnnOaU3RmqAkaV4r0ALAK2ZZ8096plIoAaWFC
	tiZn64QLrkWAYf4X2o3YUad2Me8smgP9o5i3xnShNRZYKamB1ZyFaIky81et1yN+8XilR
X-Received: by 2002:a05:7300:f187:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-30398699534mr5640408eec.23.1779089185962;
        Mon, 18 May 2026 00:26:25 -0700 (PDT)
X-Received: by 2002:a05:7300:f187:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-30398699534mr5640399eec.23.1779089185464;
        Mon, 18 May 2026 00:26:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30290c4a699sm13409001eec.0.2026.05.18.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:26:24 -0700 (PDT)
Date: Mon, 18 May 2026 00:26:22 -0700
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
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <agq/Hl8qWn6wpbF4@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
 <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
 <agqMgkRwKqr05rms@hu-qianyu-lv.qualcomm.com>
 <bbd5e74d-99c0-4a18-bc80-b3658b235bf6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbd5e74d-99c0-4a18-bc80-b3658b235bf6@kernel.org>
X-Proofpoint-ORIG-GUID: FKx9oUaYNH1f2I37om87ZbWzmDTn_uMb
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0abf23 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Wj26GNSjI57I_fwXRWwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: FKx9oUaYNH1f2I37om87ZbWzmDTn_uMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2OSBTYWx0ZWRfX4MUUoyv5Dpfi
 F8AUYEEs916PWClLkaE+gPAPXuk6oOEkc4NeK++J3ljc3fOWXAErFpDCwSK4c1BTbcPRr045cOc
 y6riYgsP3zGkZPtubQjbwrEsxhESzntRf8BSBU8ns71yaYmEFLX4ti6ysCmbKE5d68x27TrF0kN
 lVP5MI4GoeSja/IpsAnDDZGDZpyexG1wX6g8dYfoWTH4U6RqMlpjjHgC2hhYF77OQthqUUu8szI
 2IdOz3zKR/dmcLC7DPeIN3ByBuWt6QS0sJcTwBF5u6eLeosGZp7OCCmP5DG9dnEYVZGSMoCt5Su
 n11pYw5QN/TJECsGsa3EnulCouMus3rtzmTNDe9L3YCThGaoXsTZswUt3yyRKayOtgaxh8gPffd
 Ruy2SIqSpz9vq2VzX9ssP2OvuCGy/8xcg9RbPSzUvhCIC141AcEKKpTqLQNQHDiz7mNAGwMPxAV
 hOJJwkRosA7SYm8QGVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180069

On Mon, May 18, 2026 at 09:00:33AM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2026 05:50, Qiang Yu wrote:
> > On Sun, May 17, 2026 at 10:27:39AM +0200, Krzysztof Kozlowski wrote:
> >> On 17/05/2026 07:39, Qiang Yu wrote:
> >>> On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> >>>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>>> required by clkref clocks.
> >>>>>
> >>>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>>  1 file changed, 57 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>> @@ -51,6 +51,63 @@ properties:
> >>>>>    '#reset-cells':
> >>>>>      const: 1
> >>>>>  
> >>>>> +  vdda-refgen-0p9-supply: true
> >>>>> +  vdda-refgen-1p2-supply: true
> >>>>> +  vdda-qrefrx0-0p9-supply: true
> >>>>> +  vdda-qrefrx1-0p9-supply: true
> >>>>> +  vdda-qrefrx2-0p9-supply: true
> >>>>> +  vdda-qrefrx4-0p9-supply: true
> >>>>> +  vdda-qrefrx5-0p9-supply: true
> >>>>> +  vdda-qreftx0-0p9-supply: true
> >>>>> +  vdda-qreftx0-1p2-supply: true
> >>>>> +  vdda-qreftx1-0p9-supply: true
> >>>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>>
> >>>> Either I do not understand your previous explanation:
> >>>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>>
> >>>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>>> If TCSR is TX0, then you do not have five of them...
> >>>>
> >>>> My previous comment stay - you are not describing the actual hardware
> >>>> here.
> >>>>
> >>> The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
> >>> as the QREF block, and each component is controlled by the tcsr_clkref_en
> >>> registers.
> >>
> >> Still no clue what this -> relation is. Again, describe the hardware.
> >>
> >>>
> >>> If a PHY receives its reference clock from QREF, it will have a clkref_en
> >>> register. However, this register may be located in different regions
> >>> depending on the target. On glymur it resides in TCSR, so I added these
> >>> LDOs QREF required in tcsr yaml.
> >> Registers are not described as supplies.
> > 
> > I'm not descirbing register as supply.
> > 
> >     tx0-0p9/1p2  rpt0-0p9   rpt1-0p9    rpt2-0p9    rx2-0p9
> >        |             |           |        |           |
> >        |             |           |        |           |
> > CXO -> TX0 -------> RPT0 ------> RPT1 -> RPT2 -----> RX2 -> PCIe4_PHY
> >        |             |           |        |           |
> >        |             |           |        |           |
> >        ---------------------------------------------------tcsr_clkref_en
> > 
> > These components(TX/RTP/RX) can be disabled/enabled by tcsr_clkref_en
> > register, and they require power supplies.
> 
> So I told you more than once - none of these are supplies to the TCSR.
> You clearly misunderstand what a supply is.
>

The TCSR binding here describes the tcsr_clkref_en clock gate, not the
TCSR register block itself. The clock gate controls whether the reference
clock is forwarded through the QREF chain to the PHY.

The QREF components (TX/RPT/RX) sit between the clock gate and the PHY.
They require LDO supplies to operate, and those supplies must be enabled
before the clock gate is asserted and disabled after it is deasserted.
This enable/disable sequencing is the responsibility of the clock gate
driver, not the PHY driver.

Since the supplies are managed as part of the clock gate operation, they
are modeled as properties of the clock gate node. The node happens to live
in TCSR on glymur, but the supplies describe what the clock gate needs to
do its job, not what TCSR itself needs.

- Qiang Yu

> 
> Best regards,
> Krzysztof

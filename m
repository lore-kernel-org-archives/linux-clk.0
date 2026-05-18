Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85623803D0
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075346; cv=none; b=T65RyVD62gkYsU8HXTArYpGVTcRnRT51avEWudo/U7iuJVrrhCrnb/9USePzQBz9/K/fZODEPKq1InQqHxkM+tj2ZTILBKGNi7dhyOV0d6Vk8o5O4JXkuR2KztoHzMrTSuzhBWFtqF0gFBetUvsWdbu+6kZWCRB9BZklHTIFErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075346; c=relaxed/simple;
	bh=kUsbM86mQMkJ2mAiobQt57+EdQcwjJauLynG+k5pNsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrVPVoyFtk5tsNr6CxexSwMeY/tqItWA53suYL7zicByOmMjr0z1v+MNgu2daoEw3jxyuQ8ak7sd6fLhPn/QhTXsAr+QYapgVTv3JJo28fT8DneOQ4zSbQ465/HnaLkg1nuU8+hsh8r0eP8F9gZtCkSMWmpSYrO6mmUIDhMYAw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co0QUJ3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyQ0KKJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co0QUJ3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyQ0KKJv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2x3034083987
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NclULWFnp5Wyf9ypfaWjAmif
	a63DzbbBWf3uDDMhJ6A=; b=co0QUJ3gPSc7AVoIy3sUbXiWxibGWwNB6cmFa4Wx
	Rq8hpk2r8qppeC061O5be9Q80yKQKs5RMOd7u8je0lpg1NtA210iqHYTGXeLEiti
	DE0zpECOP08qkHaMcbEgC5CqTkV7D4uKrwDNcUtYlVPnXQv6YwJOtG5NptelCo5z
	NACTSS6pXvKZNBhEHbjPaaZB32TaDtxLxDPeKkLYGcPF25X1WoasiIS/Xj2wHjPo
	zpRI48HoqVOx1HugwKS9kMLlZC54MIRDmt1UtgMYHTcMkgsURWeJRxTBCr6jbygG
	JbZqg0+uQwktsOsQWWqdA+w+DapOPrJIc7vcWqE+8PoVUw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qcbx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:35:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f2d983d109so6226165eec.0
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779075343; x=1779680143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NclULWFnp5Wyf9ypfaWjAmifa63DzbbBWf3uDDMhJ6A=;
        b=LyQ0KKJvmkaz4l975ZUnxrKkPbmg26cEZIZ7x2FtqD51nZIPWloDyAotIRN7ut9KJu
         hQzOtyshfZRTB5RH+R/Fq4hfpBia2W5amybc2g4/he1RyY0nymi0ky6sBF0ZxLZkvLNB
         ixgf5zUFhJD7s5/GhepgBIbs/dzJnetaMhi+4zdCEEIwaOaVc9ACAPK8BEBsw0hH4aMZ
         iv+d2kb75qv5sCLwAiotgBeBW2/u4o8wcnvZ4wPaeUgUidyn6ZGYzak8cBTsEE8Vn8J5
         95DAPBQP5REYdDi8mghH+uplJAU+Kxd4LlKWmemaxGqRI8bpQRBnU6ITb2OUFMNlAV+I
         FNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075343; x=1779680143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NclULWFnp5Wyf9ypfaWjAmifa63DzbbBWf3uDDMhJ6A=;
        b=hKvgcCJv9CLugf9rNMxD0j0QocO+bte8x7koqsDN0rS50yUZ1dksQnpm9Hn+W/UJXR
         qQUhETYNp5HDIChq+6vBRO6yoYnHL0MZAyA0qX4oCOztTfvsAAUU6vLP9oLq//HHOTgW
         z0HjetFIueWeQ8lgxUA98jtgAkcQjWtwxc04J3YlB81GCbg6zdXb+DkUjVGa64MDIpsp
         gqDv7Hd6D9edoe5OlwrgZ4zlyX+HPZcV8+hqtboQVwNa6yhFnoO57L1jyoSojCZGKiQR
         io8rsJ6ObGn1Cm9nUiSkli3KRMtHFGyslztJUEEpGqVxMbCOBeI3B4+OdDMJPiyshM3M
         UZ3g==
X-Forwarded-Encrypted: i=1; AFNElJ+DpkEsKmyiz4A+kQRpi0y7WNKyF/0YOp1E/3HpGsd/7ARyTYd9xF5y+3aMEUiBp6AbxfNiIpspIYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbQxQAZEtI/FLe2yue+al/AQpMX+MaGFkcVdxkXJQSutAqRd8
	sKUlUg1Nb1APPkh9tm4DIjUa9eOehlWFtEkbU/v1j0bT1kqNjr+mFd3rEeitEevgN9+8sizOQCb
	MENZ0SK1d9vzRWf3swJWXq6y1rN4tSJDl4tOAOKk6P4etta4jdkTXUwFa8Fogv0c=
X-Gm-Gg: Acq92OFl0Pj1KJSj8FoHE6zlcm5A43TVyHJg2gGIU3mDAqikzYf1dacoE2ByIuHmONd
	FcQslr2eBFR6VBjvVj2wFGWnHzMhDzGMuB8f0ge7520/YOYVisguY7s5Br0L8rYTGsJtXNRdOWU
	0Ay9FL3klG8yQlJMwRG3zPe2rVA2VJzCVSVBi7arUuAd416AH3bjY/RaVaMmC9YITtTww97eNAS
	lpL/p7S5qKGpRhGbJ/oaltShbton68AamamIBzgIf5Re0WololozpQNZUl02s98mayKEsOxIszi
	AVkq8ZhyEgEoEQQ9bnL65RFY2cEDm91//mVfyXFILeSBirprhOlC5zgeHhYg0QXib2CvM0d1K3t
	wKeovnJsN2PlYkalZnxNFBTJ3YObzVurDxI8dGiykxh5AL2gk5LXTlyul5+C3VP6TuvNj
X-Received: by 2002:a05:7300:8184:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-3039813d598mr5804140eec.7.1779075342613;
        Sun, 17 May 2026 20:35:42 -0700 (PDT)
X-Received: by 2002:a05:7300:8184:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-3039813d598mr5804123eec.7.1779075342049;
        Sun, 17 May 2026 20:35:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm12214853eec.10.2026.05.17.20.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:35:41 -0700 (PDT)
Date: Sun, 17 May 2026 20:35:38 -0700
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
Message-ID: <agqJCmQRmFwhFClV@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
 <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
 <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
X-Proofpoint-ORIG-GUID: mYs94gyDBGYWyFXMAgV9BCacrFPb5k3Y
X-Proofpoint-GUID: mYs94gyDBGYWyFXMAgV9BCacrFPb5k3Y
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0a890f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=12i62POrZIV3eSzbxEkA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAzMCBTYWx0ZWRfX4EwBMECr5Wgc
 gQdZvuaVmJWJnUCm5EWMJTiPPX/eZHT0rVwxQzztlV6kypQqhT1alRmT8fvvRbL8G5GcWtURJ21
 J4kvqynCY7vnvQRUPUzgF471iTUD3jEBJtMVWU42w1T2XqXEev2JBxZjVBRyNBHV8jEdLCddxI2
 2QRi/vdff6N/VHev5r5bo00ToY2G22onMNKZIFD8R3oySNMtUND+6UxPuzcAb4rKu8L3Zl2gf6b
 EpsYYRuDIYhvSZ2hEcuWBBXsB4UssQ+0apUykmHrIInDc8K1s62USEEJtHhZqs+mz6cRt47bFRm
 4+nq47HHLbKw9CoITKtlYuV2hTPo33UVZw6c1vti5S0Tv15fS8eVaCUxUVe+btRk5MYXwESEZ5n
 5EgnhIiF+AdIgh9BvfzOKJLMU85XPAQ5saRy0TJTj4NPWWYuSCOUyZWb0p5poidMRFnsGSDbsg3
 RZ3ugUUkgaUZslUrZoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180030

On Sun, May 17, 2026 at 10:28:48AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2026 07:58, Qiang Yu wrote:
> > On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> >> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> >>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>> required by clkref clocks.
> >>>>
> >>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>
> >>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>> ---
> >>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>  1 file changed, 57 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> @@ -51,6 +51,63 @@ properties:
> >>>>    '#reset-cells':
> >>>>      const: 1
> >>>>  
> >>>> +  vdda-refgen-0p9-supply: true
> >>>> +  vdda-refgen-1p2-supply: true
> >>>> +  vdda-qrefrx0-0p9-supply: true
> >>>> +  vdda-qrefrx1-0p9-supply: true
> >>>> +  vdda-qrefrx2-0p9-supply: true
> >>>> +  vdda-qrefrx4-0p9-supply: true
> >>>> +  vdda-qrefrx5-0p9-supply: true
> >>>> +  vdda-qreftx0-0p9-supply: true
> >>>> +  vdda-qreftx0-1p2-supply: true
> >>>> +  vdda-qreftx1-0p9-supply: true
> >>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>
> >>> Either I do not understand your previous explanation:
> >>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>
> >>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>> If TCSR is TX0, then you do not have five of them...
> >>>
> >>> My previous comment stay - you are not describing the actual hardware
> >>> here.
> >>
> >> And it should not be my task BUT YOURS to verify this in hardware
> >> programming guide or manual, but nevertheless I did verify and the
> >> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> >> ports and 5 clock ports.
> >>
> >> No supplies at all.
> >>
> >> Then I went to QREF and it does mention few supplies but completely
> >> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> >> either.
> >>
> > 
> > Honestly, I couldn't find QREF LDO-related information in HPG either.
> > However, you can find it on IPCAT. For example, in the glymur power grid,
> > these LDOs are clearly documented under the LDOs required by each PHY,
> 
> How is that relevant here? This is not PHY here. You are adding supplies
> to TCSR. Do you understand what a supply is?
>

I'm telling you the fact that I see from power grid table.

- Qiang Yu

> 
> Best regards,
> Krzysztof

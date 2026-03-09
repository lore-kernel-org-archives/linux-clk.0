Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C83A4F2D
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058190; cv=none; b=I3YJzQYzJP6QsthdJh0mcgZZkGtTvdVCDGwoydb4pDhme2uAbHqwsX5I5rb+CZ2CJq0c7zzGocG0TkAmR8dC8owso+qdc3XeL5fIndwhEiGxsKlFn0qxmatVV+lN4IEsCm1OLT61W5XXMimoEyRfYtlWsK3aHG/k53x5+bI97SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058190; c=relaxed/simple;
	bh=JwOxq0pFoxiQTlNl0toNq+EGO6No5r7lL6YqkNe8BeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3jwno0c8Ah0z28icCD1UMD9KK5O/lXZoe/beuGDGFl2h8A0oVXGpLdyhGp517KLsPW0kHyIzip7hAfJZxGKUoXxv5IaJO5dxbjFD8btUaYbFOABBzIxt9HT9Gv2PT6xRvnWtNGY6kBln6mqa6lqwskhhtEChwnYc8Oxn4P5cCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM8Vm27w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaIhA9b0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM8Vm27w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaIhA9b0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629C5eLs526835
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 12:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FHnNc+U6HKMwPEIKj5LiXghp
	YCkex9c2mFBJTAIbIok=; b=bM8Vm27wx2lWU4bhbbatg6JSoJhpQLc6H+CSYc9y
	27aqvZPe6zF7u7boJzrXzfEc3hoDuiIeH1RZ9bSpePdH6LT5u2cMsIiFeinMbOi1
	sqrnkl7pvqE7NKm998LtMuvtZ8Khf+0H3irnwr5Fwkd8eg7JdKvW3xApCVCF9sX2
	RfgPmWWtd7619EaXqDCJhTYR4BEVzu40b+fhzyyMLNYy95CiBg/mw6aKuH28JRgo
	XzDnKI1TXs0GM9702uYWg5kUyMNy3XYD+3AZwhUFa1S8eAWVxKKUg5ppBr17F2jL
	fu6JYnB03QDpd73gJaXzBcqPM1M/nJ4PtM72x/GsPHsXAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkg0q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 12:09:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so140325951cf.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058187; x=1773662987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FHnNc+U6HKMwPEIKj5LiXghpYCkex9c2mFBJTAIbIok=;
        b=OaIhA9b0iMIsVl3v6v3wVoq6vMrvkMVClwAcvun/e+N6WJtRRX5oFGCJ6Oo2ud6UXV
         yi4ELASmebz6wxzJf+yWuk8Fys8EgSE1SCcJEsKEdjSOvUfDfBxQo/mBgeNRiWghMYYV
         aVsdG6ocU0EWq6SB5Uuh+4RnWuaEt3CUMeD3Aqv19u5udlAQUtbNKxtjFJnkhBmdPy6W
         2no9+rPDPBT/tRh6pPROgr8EcruumANcg/g/WPNHYTIeWDJVP5HZkcBw2kriOc+n5DDI
         MibUPCnDq0Pp7XDZQV+UCD+e7OH6E4bxXncaSh3FgI6Xq8c8qhprMVwcojqdq8KQMAhQ
         7JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058187; x=1773662987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHnNc+U6HKMwPEIKj5LiXghpYCkex9c2mFBJTAIbIok=;
        b=OvUuyemmCFOqP0NJt4qca1SrFwyde4QNIKNZrR+x/9nyTmBVjZ/1UGLD7bgpnatygD
         MDl1cN6bkgHCTtUYNff8leAfuSBAgSP5iHU3L+CoStb2WLBxho9EEswVDhQEIXBk+/oA
         0fVsb/oRdW3oiBUfXSoEaqcO93q3Njlfo/lTnKIlLxRmd3u79q8pqPBVIRHSqmhww5uY
         ByWbF3GhJHPxf0lNzPe8g04Qjs0LsY59PmZpqNBKBpRlKmoOV9Kynb+mZyw6ha+eTXU7
         jfxZ075yo26Ywll7w2FnOlSilnAEBH0ZjFosbvnZwLIRJIWB9/Sjq8HK11cl5G8E6fdF
         z+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU1F0aW8VJtFv9eRzXNppYd9xk7vibvLcoJ4SDi99qqoCaIE6ttoXxB73YqvL9gHg4++B3ReYtFDDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmb21AJrvT4FL/m2KrC/AosQ3Ar9GdreAc/B0VZxIO/Cn1Nygt
	THrtta+1OgY/UeTh1TFQ2pNERtVVn3ObhMm/GOPzYhuM63SyoyunGOF4bJqiZtX1mnZ4x9bLrSS
	9hoACys2oIgE8aWL1pIP//Zg6cl6sCozSbj5nSRCmOJa11bh/qAdHqAWX57dl+b4=
X-Gm-Gg: ATEYQzzJSx+UaacdDvOJKLTK0hyVj7S15tcyFm6yVrZbpBfORaDx/byAo9BWLs6iVgs
	7fWXkHHFJniO3udZ/4GO9guD9uTUiPsF8+sXA8YJGwRvr3vrwmYRO7cY2OS/DoQCe0kGHPhp8A5
	siYnOf5qQ3fn38TwjR+kc6m7BB8KM9pNKLqwSeFJI1nSWgNZB4rSyocYlRkS2l+gYKT5JtCauIk
	6Ae+0NuuXBcd2t2mDKgJAjieyPN+zZOU+6H8LYPy/wAMKxBWoF5mAJ10g20KPi+kQ0gmlICdi8k
	pATEbSk5u7JJoHirt/7Ivxr8Dgy7op5YHO7DooOhiTyv7Dmf793LHRJ9nWj3puArsm3nAF84F9Z
	rdvbJvrLsAiAr6rlrloevepAW89htid1O5SaY
X-Received: by 2002:a05:620a:4093:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cd6d4b4efamr1372445285a.38.1773058187253;
        Mon, 09 Mar 2026 05:09:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4093:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cd6d4b4efamr1372437785a.38.1773058186689;
        Mon, 09 Mar 2026 05:09:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d840sm28998040f8f.8.2026.03.09.05.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:09:45 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:09:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Tie up the CX power domain
 to GCC
Message-ID: <zvje6upzpskxzzq7f22oastrfw5jkbdyzwwexsvppvmrlgxhke@sp7g6hbn3l6v>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
 <fa8ff125-8680-44c1-b516-66d06eda7b91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa8ff125-8680-44c1-b516-66d06eda7b91@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69aeb88b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_0VSbVN14Kq7ih5JQgEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TOn_fXuG7wBfXs43VeXjiTLI2Mxt_TUT
X-Proofpoint-GUID: TOn_fXuG7wBfXs43VeXjiTLI2Mxt_TUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMCBTYWx0ZWRfXyEatY0LZJzr8
 5+2GxVDcpLP4IBN94iLbp83KWgp+Tl+yeIHVL+hJsha7CBvxiSAAKDBgeG/50o3IMSP163ESgzm
 gt2qaP63mVPxgLFS3nQ0xh62AJK3HpBdCzZM7A/zKt37PVL3AdWceUvxhw8Am01Tlj36RxXi8Rk
 2l/YknLld/ybhzh3HIQBhcUZVFIcmPdzoI90HFWUqilFQnZHQjLIqLSBF7tGow2lU2J+sutmZUU
 9fRPazojr3tz2jQP0eaCGfcAOJ81o+HUQIB2fyHwA46wDLCfjeQ56mwZSfmWtstleo2Y/7Uklj7
 lnEBSJjei9o8VkqWhjNpBXNoNfoITHZZ7amn7Y1si41Ry0zLUGLPNowpJHrD+xkuWbFVt4wYoTV
 TVsgvL88Ud1roxfu2jKlUNRL3uZfejCxymsVwFqy0MPixraAOxARFS4c+XLn4btslCjbX5qGzFz
 /chHnTfHdhk8H5nALfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090110

On 26-03-09 12:17:18, Konrad Dybcio wrote:
> On 3/9/26 11:06 AM, Abel Vesa wrote:
> > It has been concluded off-list that the Global Clock Controller needs to
> > scale the RPMh CX power domain, otherwise some of the subsystems might
> > crash or be unstable. So adding the RPMh CX power domain to the clock
> > controller which will result in all GDSCs being parented by CX. This way,
> > the vote from the consumers of each GDSC will trickle all the way to CX.
> > 
> > So add the power domain and Make sure the required OPP is nominal.
> > 
> > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index e269cec7942c..2d1ffbf53730 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -764,6 +764,8 @@ gcc: clock-controller@100000 {
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  			#power-domain-cells = <1>;
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			required-opps = <&rpmhpd_opp_nom>;
> 
> Let's not keep the system at close-to-full power all the time.
> Please drop required-opps.

Did in v2.

Thanks for reviewing.

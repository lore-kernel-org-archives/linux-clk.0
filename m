Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604612;
	b=q/KHJh6ob5jYoP4ve3ASGfIDNFfD292ozs6RXT7ykrj/BDZ3RJLDw96np8612Yu6wg2K
	 VRijuB3KWPv50QvtHjGqBBQwXQNFhZ+OQGqIzuvf70oCn/TS2OXBxc2lBtNv7RbXJq55w
	 u4ITyGRGSVXYZ+vDexI6lPv5nOHTETPISJnmUOuq5+EAjKFZ5t/Jx3jUtO2iyvW48ebxf
	 GrwZ3IIyy+VSdmEDyVI82J39bABdiO9tF54bVY/aksoi0DvGEkZmFutGNDypucqyeTMXp
	 kIVoeCUFd6NYc3BjTqSwBP4n5+ihdAkCXdzY/gKmelR9OosD4uinhcv3gdhPnGrR/Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
	b=vfPTwF15jFYfJBY+RUlH0lGkvDgVsoEnWa7LLIjUvSl13mtxYxmMqPLOsVGkwPyAj0t/
	 tpXDzcc6PEUKa7MvtHDa7I+ODdGDNhtwD9/s+hsi5ddzFgCkXBscpp6r34mw6gLKkhv2Q
	 URXitiCUAGjfT4eIK/WE9+2srj5urctvCZy6lEM2uPBWRQHFLQF9CXfNwwLqzsC0CT3oI
	 Ns/UCBcaAOj33C42tm0p+8OLgT12w3WmI2djIRdQps7FZuzoGtPqISSFL5RRcpuoTfJyY
	 SdYCaGZngl5K6eMb55KXkyDkTyIVf1OaVM/fzL7+rrkVUp+D6fYZA6a/OUcHIqKQ2xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A61606A31E
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 17:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTxxf682101
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSFKPdeTRbaa2HPhrRZ5lrX5
	j562cGmEBOpF2qSZv8s=; b=khjXYNgYOHV8sfchxq2tMxChs5gp1WBoK0+wGuuV
	vrubl1HA/2f6mHJ/1GdZHeEEjTsGufVlDRIDYhhf6TlrLzYusF8ifSqsd5wE+Abr
	ewlyso1tgsJDKqPW2E7FEgTk2y/7HKmg1Tee05FkYZZF0zI428AXaBt9BhhVnQBB
	+SkzeP/dfIevydKZatyDL1pMO+Z6mte5JRAGq/IMounxO/iRlt3FVUw6CQL2Cx7L
	+ytgjwP39PwH4lCvSKTFDxhxr8BoRdcE9AFyqm/twgU+8QAulUUk1HqYGaxlswlS
	F6CAV4HrHchMvniE8akFXyUO1X2up4jPjZHiz4C1abruhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vs68b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so202682985a.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604610; x=1793209410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=OayrCijp16EU3jPa5yO8/sliQOVNdMKp/iB4XHvSCVTnyR4HHdltnejRAZQyZdB3FN
         dBRSn6MpyyL+m4moC64PaPx7BGw80TS6yAsudVpQt21kHjdXUEuE/l032wm40hcl7Uqd
         C8uHVnivziK9SMc3d4YJ9DOGBuUyjju3qZUCdVQ4NhgqrHA30aLEi+iWIsUtanI2snc+
         y18KexqiONjCm8L5S00KuQJA/4DXTg5IkVH2J3pBzs2hew4O3wTXJZP72BitnlX1aYO6
         8ENNMbQ0l3XV4w8jyxn1cXw3+L+r5E4auZosU4O/NKMRBGPzgGmfXbQXIdEil61nTRXf
         GT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604610; x=1793209410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=Qp5TKFjA81ipJ+oV7jhaeAi7T4VQ47ilMRfjmb++mSWVv4kVkbukufrc+c9x1aErYI
         +S06esKNrRbK5VOhVt9CqWwCcQR286XsowTx4lecIwq9OFMcLyDojruu47l8wRxBc1eq
         yX4WaDVi7M4Lv5t/VF3dAz3cl/s/2h+gUiWIbZt3mAIntEtFrMd3P70RlIyx6UCyiIC2
         mHSpiqJZEmR/XBQF0jJTltBwF0Qyd5EW5HMSFmjRePYypPZNR2pF62D6vPheNni68gtA
         JiEZnTd0R7wv+7jMyb0Unm39TB8Q3FFfVLGhRtyWNfUuf7Kde69v82ntKe+vHGw6bOVc
         g1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBweBXkTX9vcO8wuXZYQbEQ5DU9pr+cfw+ynfjhE4DXJBOCNMm1EG+Z64qc1lIJm1PD1J58jCRQyA7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzrKFSEmXgWvECYCKpV4AUBiOSq40Druexl4XFfUJG9eLhsvHX
	QiAXjWrwVbP8rYacFZkqE95EotpJ0O7N8aWWHx6EBtnUONNAjVH1gv2xC+QO/Yg3amuPK4E0N/s
	UTcWM6ulkqQT8UK9uItS8j/rMplbtz0mhZcDB89h+dJ8ZrpIhlaqsWhQxdeK5kOU=
X-Gm-Gg: AYBFou2zRk/zkkIjTXtnYWMe1VysHLVhcmtHy3BBv/s1IF/0YX6h6ydl8ZoGk1p2s+q
	SHKv9IgAUtRxBB6jikUnHp0sJYNeMbWwWsidhQZFx1PLotv9CoOTE/Eezbmk5Ow4dO29VOD2yY2
	TvTZ34YagU6bniuHuDUlCaN3h7hAFWYdOS0Qjk5xja/XeYR6sbFIYYG9KHw1ZSD5tQkIxjXt3Qi
	pgkxY5vHZgyvPv4cBw1j4JdpzDTt+32PT1sy1DakxOMNagACaJspR4jx7ixh4pzaI+Jn3FdeDLh
	VvtxEcuCRXkbNPkTb74DuBWa46d8YA1Q6UgCkOfHVWfXE0rXKSaNrtL6LldjrjwdMwMqY6k5qH8
	JAmb0vVMcVMNzmQkFNaRqWpOK3rKKs2KOISqXFS2WiSdcwIWh3UWxOxICuQE1BiXThLUMV82ybN
	lI+OSFquvTAmhG
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527031485a.47.1792604609959;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527027985a.47.1792604609508;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa12040ecsm640028e87.35.2026.10.21.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:43:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:43:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
Message-ID: <tx64ni2u6paa7pofcylmlwytjjqsi23pbiqnhp7wywbbywla2f@3xaql533unhw>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gPCIhZt_auOCH98t4n6Xc3081kmvp5fM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX76veLLLcuH1P
 hX7+dOs+GWEchVIVl1WG1qHcSIaCj1gHyqSkFH0uyPu0HmrtRZHYQw4rlPzfxixsWDHTuEpcu89
 KMFJ+ew/eRD7IEjwx45XJmj6eXNn5+E=
X-Proofpoint-GUID: gPCIhZt_auOCH98t4n6Xc3081kmvp5fM
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8f9c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JR2_SSPbN-Trn9morxEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX3FLVyP/UiXXW
 M1j0da6I/l3XHWQ1jnRzVinzYRkG+tjHM7UItnaj1H3VgblAk6NwYiWNU5qGl7WFlsw4HMs4YOg
 p3JTS3Atm7/ne7mCrdQ2MuqhBdvTjtw1mks/nN/05whJsrRNU3w5vmpI/wtE9rjYRmDhzidaS3B
 wWw25Z4KJks5vzqSR/X0T8jVJKxxXEmLl/bTbCKIqc9g7Fd+o4J+XkNtn//hlpO1PdEi2JWp4pI
 FY+ZlBPChT7wcqEElUWJWeeeZs5uZHLNAK5gfiJdwVkjvyt+zUfDJLkARzi1GeotpQ68jPup8qB
 Nyh14WfOzf1iXTFZpHL7CGByG5cEnCDumaLLwufGpyLlbR/blOtmquWjiuSEtC9ZfNKb6DIsnB+
 17WC2n/bQ/tasuBW0A5yn+ziIrA+VHlVhhIPQ3EVMC53egxxxLFbxMQqkMBwKas/WY/vJLQYWAv
 SUI08pajsQfcLAQ9Fiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070

On Fri, Oct 16, 2026 at 03:50:19PM +0200, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> > On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> > that provide the clocks for the A55 CPU cores and L3 interconnect. When
> > the APSS clock driver probes, it attempts to reconfigure the already
> > running PLLs. As part of the reconfiguration sequence, the PLL output is
> > disabled and the PLL is placed into standby before being re-enabled.
> > Since the CPUs are actively clocked from these PLLs, removing the clock
> > during this window causes the system to hang.
> > 
> > Avoid reconfiguring PLLs that are already enabled and return early,
> > similar to clk_trion_pll_configure().
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 60173b076cc5..3641b2da92cd 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> >  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >  			     const struct alpha_pll_config *config)
> >  {
> > +	/* Check if PLL is already enabled */
> > +	if (trion_pll_is_enabled(pll, regmap))
> > +		return;
> 
> Please add a debug print to match the other similar calls
> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE314D0CD8
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350518; cv=none; b=FQj1RCmuCIVMWYyZzstKllCeUZb9TGaeZpR74gWglRKsZxUd9ekfkQEJ9mlUuxWniB0ua31rxwmiVMFfdDmLanQf+s8KmWGpz0cMR6gdWoI4PYWCDsmq4TTFxfEU9GvySaZ/3y+T7MAZKbLaKObSK/CSepsAgcpu7h3DgISuB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350518; c=relaxed/simple;
	bh=JaK3xKbkE7wgtjaM89B5KJpD0MqI4l82LuAW/Bbj87w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6upguH3aLGUK7n+8RSyLj9ogSUYJsioefy1REyBZkfDv1pePxSzSjCKMLHGnHJ4ymFBlq9dDqvriDQfNkO9bJCy8qXhCkUIQyepr0iQAmiFagIk8KOdRnjsKtRnbKAdbv28xEUDmossOaBvr3qvUJ5+r+SP8M15o7yTjxxyhBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdiLf6Ps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9PrFBxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdiLf6Ps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9PrFBxA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE5kC93627535
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iLVqjTd3vlJrX7TuKVolKFoP
	zagTa2lbaJ2iN6D9p1w=; b=IdiLf6PsV6W9P9nqrPW6yS7IfgFot2tki0Bd+sZK
	k0DVKOgu+wPaHKoQcPbVZSTQ4CFnv3eaVNZdresMoVzq3+CvnH/Djs363T8EQTeg
	BT8pRD/UPV40EBAvt+VXjlhoflqt7OP8ZrmkpAL1R7BO3+y0YgufP0BBTGn7gPBe
	QehtM9mIr3mUvWvBMCUx6wzigpxIrXOfX6Hss5qo5YJQN6hcY4BKB8s0RmKsjbYh
	Kq5YAlloBernxsWP/or4VTr81KHvXg90nIcih9uXr/Ar4GczmyO0REaYngZI1NsS
	e9f+WMyRnrlNZ0OzMszXaKjax+kbUSAtqKGL61E7u2jGzg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3a0g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:35:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a2639398cso1422045b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350512; x=1790955312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLVqjTd3vlJrX7TuKVolKFoPzagTa2lbaJ2iN6D9p1w=;
        b=b9PrFBxAEreQhngEM9eZiNk0rr6nmPzQSmwAEFmSJGeLHGS95HkI8CkxbyMXfuS+Sp
         LTNuiU+Kgq+b1+4KBx+Tf1undKd2G8Nf7nD3UNfueRFyGLCrg1cQh9XTVXC+5KfOI56f
         DWLqgRVsCuPAAm2RwSlSyjxD3BuM9WhuVUHvT4GTRBmGzMM0V5mpDxoJJvcXoxycwWW8
         kNEejLnXjEY+zRCmzfqp3KViE+cJ9+MKhDVapzt0Qx7Wj15C1KBD+WF7BKvUMqh0EXJz
         j+zjVLWxQwxbwqDpo46EdZ0GznQ1/SgAdIAPkYa2Q458wCpD/PPenHbPtMTi0o3FOWig
         UA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350512; x=1790955312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLVqjTd3vlJrX7TuKVolKFoPzagTa2lbaJ2iN6D9p1w=;
        b=fSk+y+29hzPAdV/097NFD/lZqaJ4MeJxCHlaDo92mG6JkgWrB7VZ6dekbQohSIt5bQ
         UthgwPSYoIgj186GC+xuwO+kFWE8prWmW4nTAv+2oYxcFAXiJMv/6WwTFY7W/gTbSLYw
         VWfQcYyqpuJYBqmPwU6gFIsEl4A3CqqW/lydtapolKhtgY+DAmHevye2/ZU1gysOcOiy
         xB2/4vPGYnyKaedcqQowWH4ochJ10w3pAWTsYAZVp1NRjbbaa0SJ8e9ER4nFbSNd3Lte
         jQNJ/zoRlcoLZgAmUP925i2itsIwoRtnCon+ad0yjon9iSMTa+WpfG1kdt+5iM+r7v4P
         iSnA==
X-Forwarded-Encrypted: i=1; AKwUvBzLZa/2uxesVQDhRlc3YsGglwH9TNMRRSlWf9HbHlyohtBQuPILyfd5vJVvOgRkAncvt5zc/TRp7f8=@vger.kernel.org
X-Gm-Message-State: AFuF++lj7wnBN/qforUX5mWcoCL0ubBw3+DIuHy3oglUVcnP+sHVodc0
	Rp3EL0MzpwAvQd7dEuMTojE/4OlOICzEUMyzpitHN5kUKfb0TJLLsy+7dRRgHCeEdGDpWpbWTAW
	eNfqoHNFfTZKW9CYW7jEvzKGmDxGJNOSzomMmwxoESCUUmbG/Mpj5dCxRnR5dt2E=
X-Gm-Gg: AYBFou1puvcCLJnXYDT2zXITwFkbMGz0EcQwG32Mn4pRR+/AQbpHpfWnCEUeuuYHQtw
	CZ/Zz3aC1jleZT4wZl40osj57kcpOls3mGhEV2xdWdy9EA/2DAGe6BIaAopDJDQpwqgTlN/t/jz
	xsWqbs+NYAsXn0DG04dp5AtiHeiBKjCTrZkVxavda7gpUxv1kesflrw68ritNZETAbtimeD2WKo
	7KZb9dgp7rdmenT7j7rjth+kpjbAu0sIc24NoTff85QpryPN+CSrR/0L0Elx4jIulacUOswBEko
	b3jPiDrLPOTr/kpoYAfl6UJKusNjgWtQnfJnxo5F+6Jmqe3VG7/+MSC3dpu1mk/dtMhTkVrbs3j
	VKozCBpEeugbQQYRgaT2ykr7P791V/p66boVjp0pZ7A==
X-Received: by 2002:a05:6a00:3385:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-88029fb84admr1967840b3a.14.1790350512083;
        Fri, 25 Sep 2026 08:35:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3385:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-88029fb84admr1967806b3a.14.1790350511480;
        Fri, 25 Sep 2026 08:35:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea884749sm1325581b3a.27.2026.09.25.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:35:10 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:35:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <araUpwTAp1xjhnqV@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
 <nwpxqyjjusepqubva4hsf7e2wfvvigz22p7yp6c2tblezz7qj6@2s2tmiggu2dw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nwpxqyjjusepqubva4hsf7e2wfvvigz22p7yp6c2tblezz7qj6@2s2tmiggu2dw>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX9TcdM4JzTfBd
 zqFlKoc4DVwuB8MGXtzjK1yCV74Lm4GQkMm/o/vYMw7tRmuWWuaACI6zKjzefr/3NqYK8J+wqCB
 JDZe1PG4d1xAyL5KZoHzO+00tAqvxpE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfXw5+xPjsika+B
 ypF7UcZ9fsZ6aQYoF29FS0XvsSkf4HpVjf6oH0uXkKZYt/6bAR1abRbnNLWKw6QvSggcvKy8iXf
 Jgm2H58NvclYUcxlEVYJZPwrbnJwOxB9xjNhYN/cTikF30rS9E6zcDjN2hxE6cLyeyddil3Etr3
 cmpP4CUOFOF3Uwu1fq/d4b4JhfCoM+xnbvf91AH4UVsuDInAt86hAwdOzPjWZFjpQPtPLfb19iE
 Wyr8AAR6bA32FTScbJe4CrsMb/EXyhupZnZ0I41LzdZl3rNBe7NtkaRLKMoT5ivqcIWsLpALhH2
 GtP9tW71GyEMg25rzaEkIst3ys4kM2APglbDNfgzVmpMZD87lyH+ykUeZjBPIGJ5BoNY18/KdS2
 +X+INcJ1yZcJOGQVHqrJE2iu6FXfIdlQPkrkbKN9ayCua0Tiql4MA7NFZN5DBmOagNKAFTW/+a6
 h9BPU3QpZXIW9Q3V1Uw==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab694b1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=XM2o5SXsTojDuVAecT4A:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ODnTBoAkJuJSsDFz9DJZkaiVSBEvdA3j
X-Proofpoint-ORIG-GUID: ODnTBoAkJuJSsDFz9DJZkaiVSBEvdA3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250062

On Fri, Sep 25, 2026 at 12:48:07PM +0300, Abel Vesa wrote:
> On 26-09-25 00:11:51, Shawn Guo wrote:
> > The videocc node supplies only the two XO inputs. videocc-glymur.c
> > expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> > video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> > up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> > parentless in /sys/kernel/debug/clk/clk_summary.
> > 
> > Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> > is listed in video_cc_glymur_critical_cbcrs and is therefore force
> > enabled through regmap, bypassing the clock framework; the sleep source
> > simply keeps whatever rate the bootloader left. The orphan still blocks
> > any future rate management of the video sleep path.
> > 
> > Pass the board sleep clock as the third input. The sibling evacc node
> > on the same SoC already does this.
> 
> Same question as on the 3rd patch.

This patch doesn't drop GCC_VIDEO_AHB_CLK or any videocc input clock
like 3rd patch but only adding the board sleep clock as the third input.
So it shouldn't break videocc either. It would nice if you can give it a
test on your X2 laptop though :)

Shawn

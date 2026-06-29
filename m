Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903121B192
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739939; cv=none; b=C4ExJTMCouVyAKYGvW5XOLA4JTf4F3V5tc9ktD0CawKyWX0sUfp56l6IAmNvuDctKLSJcU5uqIWZqYF7GTuLTDYNaH9qx5G6FXOv6WKUAjtRlXIJgNlUWlDkc+fl6LCqYckdqVXNxKnkArQ1jJYj3iITDszY74C/JbYtTbssM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739939; c=relaxed/simple;
	bh=b74JLjLDWqk4nSsYRgZYJTbHpFo81IIWs/OAbVQDBIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Csg9PetWDchGNSGI2cAbmtgwFGiid4cCEkyLX3hWw7aPRC3kRd9g6g9uKk/muF7AtHz5NI+1qZeeotbXXgaUjTG1OPXn3Atn55joCzo4UaB5+PEQqUHokOkKf8raFcCjjOZK1sKT9GzUcbWgJbQgyqZ8CLibqPUkYoMxusDRqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4a2HQrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akAyRDSR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4a2HQrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akAyRDSR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATA5W2627980
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 13:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=; b=n4a2HQrNBuc61hNa
	AW87dSWHcEbWWQsMytCixz3TLI4CBPM9sdXPcoIYpjwXUsiPwhpLhg6fMfGieGJD
	x/0vmEMSeO25SC85frhhE41QNmIo4jVzFgOx0gmjl1K6R112DAMU4nhkdVDJMnxj
	X6oti9mhuMZCo7QgKytjtc1skWIpSrr44/DODPX4ucPxqL9orhvjYoRHmP+uITQo
	00J/nk6LyL+KvFUmpB1PePufkMi4KKNBg53C9TrnikIWzIlRVOqLZ74WDDXrnVes
	+cTW4OoEaLOy5OJfPnEhnLfYUPpNRvr6Fi/tTHOBuWOLINGqfo4Nj9mSdzC879iq
	+TLy1g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs3kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 13:32:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so881510eec.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739935; x=1783344735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=;
        b=akAyRDSRCKA8ppnXpfRqpRZKLZ7Ge2V8eDa7qa0U6Vk3Kx8s5jYXkllEvy5BuqnvjC
         XiLJghCDjmF2m9M89grKcxY9L27isQil13rBOfFnH286ktolG/2jX4TFlFiQtiL+nF/C
         gaqqmHURdCIevlP9B+9vcF8Lq6+/n0oc44En/crUphqNKfMt2lmgdphRiaUCDwY8plil
         UqAfQlNpJ1MhyFTS8DS17IV+D8Q2DrLK0WzJBjoar2CnH/Clm/n5741HiwyROXFd9M/3
         D77JdC+uMKgYjhoUPyBty8EdXFcSFZm4LZhknAAFdEWI9zfFjpdSVL9qep58GRetFxEa
         vIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739935; x=1783344735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udHIJPFN9+CZa2H7116UwQG6qq+UOMnDM0cL9UQL+IA=;
        b=dVzuJzpQZ4WAVnZSVNChlExaG15euzZCYvduid3SPMEBjc94sayRIYabhxxfRlWylL
         EUSFciEm4MCspGAk9ofoItb6yznTNE2FP6/GguI4kRdAbCCcn6MbDLCY+Kh80pWhrPw4
         06lreevBGcK1LTkJpPljiqyDAbL1DB9WWHxWLNqNR0EfWvWVWbsoJz3bNq8UXqUbNW0V
         j3QotM6Y1rCRQNB2hXlsslnYbhq7eNpMtkiTQqYrE+NDV4pH3RiSUtCjzoqE2Qw/1b7Q
         YwhG3dk2lxH4dUIn7qhcRFQz9oryskRqhIVFbEJ8ei3r4QFJMxyrFMwXB2hgs0Ruyblf
         vrCw==
X-Forwarded-Encrypted: i=1; AHgh+Rq407X3u0YloaRZLyENVvJzn0vXZ48UDFopHgMxnW2j8Ob/mC2LAzKJdEZ6jY2dFq3bunC2RAt7L+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzsv4FodXna8RvBEx34J9pnGukFVA0I1iTaLxN7tpU9EfljXU5
	Y+QFlmLZSFKVLo7SWkAqIUPwf62t+9kqxx+xc4QZHLFn3ODMFCSrJvbFq7ZzDIM7tOFZJTpZMck
	mLWYDS+KGt2Pm1ttJ+EMJVkL9mtuwg2xdjY0cmjwzdIRvmHOIDt9woAA4VHJYQudsINj7cIA=
X-Gm-Gg: AfdE7cmD96pJoT6HqYuXaXgyGSqCK47czJFjsGyFNwkYhGTSlWcsx4eeZ+PFpETK8NE
	6ewsPM4Xo+wsJ5Z0+p0PHuA1ou8mJuk10g0Mz+hYTYJ+JZh1l33Vi5NwHp9yD/y/n25mumPLHAb
	L9JcpAwR7pL/85C5xBcAHgUE3P6ba7TSLyKZYBP3pNBfRNWUtmQARRtcXwoP3MJgfnIuwSmTdnJ
	ESrCuQ5ElKv4BXo0ga5nIUr54bgVsx+8DiUUStipk7pQpf/SkOVKUGIH7C8+m10YkaeMa47Pclv
	VXKD5Nrs7YUGdeCrjVeOCZ1Pm6IP4KMwqG2775/ZWxUCuCjUWDIg6fLTor/+04nfBdEQmI3M8KO
	8H3CF7Ds+Il/rRSGePBiYOlJyp0NPq6u+/twyq65KSHbIx/PSikQScHUNNA==
X-Received: by 2002:a05:693c:880b:10b0:30c:b0a8:c9b7 with SMTP id 5a478bee46e88-30cb0a8cb0bmr5980120eec.41.1782739935017;
        Mon, 29 Jun 2026 06:32:15 -0700 (PDT)
X-Received: by 2002:a05:693c:880b:10b0:30c:b0a8:c9b7 with SMTP id 5a478bee46e88-30cb0a8cb0bmr5980101eec.41.1782739934422;
        Mon, 29 Jun 2026 06:32:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm60819417eec.7.2026.06.29.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:32:13 -0700 (PDT)
Date: Mon, 29 Jun 2026 06:32:11 -0700
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
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <akJz2xNeuzIiE3Vc@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
 <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -fRKYuASH2nLRU_XNEpQHinixIqGNWKw
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4273e0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Qo-gMjb1dFaPh1ck9-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMiBTYWx0ZWRfX2uSxzLGrx9QM
 n4ogpcSJarwk2HwetN/MMrxtQmNvE6Gt1s1h0xIU8CELq5L9/x8G1rhbYHdhIQTcc3LH1xc8yyx
 7FYYykoJne7a2kRvnw81j20pDawqUdg=
X-Proofpoint-GUID: -fRKYuASH2nLRU_XNEpQHinixIqGNWKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMiBTYWx0ZWRfX/a1Kr4r/ia43
 x+tN8a9+EDuzEEyYNfdIebckFg7baKdkWnihiEgcWNyH0o++MKDF+NNy+sQQnShiNqEhGQpnkJv
 LcFTc0Z8iIXidfe7PKxkI10mh21pCZPK1gLK/hKWOgKi2d7n2RqU+1YXIlx3ZGiPkZYWuqJC9sj
 eBiVJSXrChhmBo7zDoHVUqV2TfTJqYKTA4yDoIOuJSIQA7whnI7kPq1WwBitTxybT3bL2COJN+4
 T60gwiYIy/D8IZbMRBGPh9Z8YcxmZVK5K9qHd0AcoUe8cUsgqGudTESQnfeHYYFim8W0Hb7UadM
 LULpzSouqShZ1ddNR9WJzg3oxtSoykT+YPBv+d0F8B4yNt+f47lbsOc6Bj8QjOV6FsMehUILSjh
 4BuS8JjGEcZBWCStT/Kr+QL5uOVdpE2z0Ba79hlLljDfnB/e6PFYKYx5WGBiPVtO4lbJrKPbh//
 9SdrAmY5hdT+BcgrglA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290112

On Mon, Jun 29, 2026 at 12:30:37PM +0200, Konrad Dybcio wrote:
> On 6/26/26 5:53 AM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 2:49 PM, Qiang Yu wrote:
> >>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> >>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
> >>>>> distinct regulator lists and clock descriptors for its PCIe clock
> >>>>> references.
> >>>>>
> >>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
> >>>>> match_data to select the correct descriptor table per compatible string at
> >>>>> probe time.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>
> >> [...]
> >>
> >>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> >>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> >>>
> >>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> >>> require QREF. So I didn't provide its structure here.
> >>
> >> I don't quite get what you mean. I see that it is there in the graph
> > 
> > I double-checked with the HW team — QREF is not required for CXO0. In TCSR
> > HPG, I think the QREF components you are seeing are in an old version
> > diagram, but it says the QREF for CXO0 will be removed. In the updated
> > diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
> > from CXO0.
> > 
> > In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
> > instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
> > 
> > I also compared the description of the TCSR_CLKREF_EN register between
> > glymur and mahua on ipcatlog. Unfortunately, only
> > TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
> > this is because these registers are not documented well in ipcatlog.
> > 
> > So I think part of the regulator lists you commented for USB instances is
> > not required, and their dts node also can to be changed to use CXO as
> > refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
> > names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
> > I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
> > in the diagram. Can we leave the USB regulator list as NULL or we just
> > add them as it is harmless?
> 
> I believe the internal discussions we had indeed point to the TX/RPT
> elements having been removed somewhere in the chip dev process, so
> the regulators can go, in my understanding.
> 
> As for the refclk toggles themselves, my understanding is that they are
> still meaningful. Although, we should be able to just smoketest that - set
> all of these registers to 0 and see if the related IPs still work normally
>

As internal discussion, the TCSR_USBn_CLKREF_EN to digram instance mapping
is:

TCSR_USB2_1_CLKREF_EN -> usb2_hs
TCSR_USB2_2_CLKREF_EN -> usb2_hs3
TCSR_USB2_3_CLKREF_EN -> usb2_hs6
TCSR_USB2_4_CLKREF_EN -> usb2_2
TCSR_USB3_0_CLKREF_EN -> usb3_ss3
TCSR_USB3_1_CLKREF_EN -> usb3_ss4
TCSR_USB4_1_CLKREF_EN -> usb4_1
TCSR_USB4_2_CLKREF_EN -> usb4_2

I will remove regulator list for TCSR_USB2_1_CLKREF_EN and
TCSR_USB4_1_CLKREF_EN. For the registers, we can leave them in the clk
array, the driver can still vote CXO as parent of tcsr_clkref_en and the
register setting in enable/disable is just a no-op if they are really not
required.

- Qiang Yu

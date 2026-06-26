Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3842375ADF
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 03:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782446017; cv=none; b=stVcITw3veWbSFiXH/Jn2YZvbbeGg3heg7HON8PPvMT4QdWJ0euz1QHehtSyMfV3wBxrN6OD5OxFBrcFm5TVEQED0/FvYLwl+JssLmWoYdYsTvtBWu976RkYEMzUtYSULh5WIzs/zNGvj8nJ2hEH1Da2VGwv5fMYEcmxtydfXxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782446017; c=relaxed/simple;
	bh=CtUrWQjJwDKAm5zH8OeftD7O5o96WykL4x21dqOeChg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iimNre47hx95AEMopmigWhhBGojhIT1ywC3P7mFsKjQquMlntpyeFzt7BI+vD0RFAhpi3eKw8JXT5Jn7mRn/sdjkI1ltllFGV//u2xdCz8Eq0oJ93ciuBeb1SjAXW1a+XJFj49JvUIbwUqPc4AZJtKDS/OEi8e16SX+XVhfXJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUWiWmDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jO+wthng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUWiWmDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jO+wthng"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2jLht3983656
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 03:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgRFN3X+rWMxLV7t9njatT5+WHhcPqBn+C/O3EaWSAs=; b=lUWiWmDAEIch/rnG
	giawvv5I5QrfmssYErDnGQFsA7dfNgUlu6zoTRbIp96iauiZvi+6cmuBl4I8z/ux
	wvjTdoLvkpV0ILrjms5twf99a2CAu5pXBRCOcovMQFqujufwilCf599v/MXZRRTS
	0JGrRxL5KeKTzhOhiWTiL5E/7fsDDgs3CnktF0JN4uJX+8gC8usD+4MV/5INgxr7
	h7/BLuUWkvwgE84d9Vt8fkA3ppXpMnQA9zUmx2Pio3oDpK7LlINBZaN/K1G+cXXS
	mzVFKGi2ovCnBpiQkLOp8zxHOHgm4Nq1JIjq5MConjGOCWBgR3KJi710tUkwB1Ry
	PK5YeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jgaw0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 03:53:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ca1f74cacso31737eec.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 20:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782446014; x=1783050814; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dgRFN3X+rWMxLV7t9njatT5+WHhcPqBn+C/O3EaWSAs=;
        b=jO+wthngWnXTPiCPw+yaKOh2xZ9hfwxhInzUhet22E0Zth9vi/aCt2hP5TNX3PGfJU
         Xb5JVDN+CitWjhQlO4fB5RK3NRFx3tHXW2KqyoVPT61XaF2WUrX/cL8I29R9MxR3lBGf
         FH7kJAmZwL61O6G6kvGduaRXhkiGesbalLNEKLcJm+6oXDRZ0tQSY8arTliobq9bXc4T
         gisKFhUItWboc6M7hWzMH6AAvinP59a8zT2RhLCgcKdbd6e6otwCtNEFphvwVVy0IMO3
         sWeSmwLy4WnXP9Df7qTpRnTCsM3R34i4XaClVzYjzbF77CJKrlaREXGdw/4iHNsN2Hmb
         8UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782446014; x=1783050814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgRFN3X+rWMxLV7t9njatT5+WHhcPqBn+C/O3EaWSAs=;
        b=Ci3egO6+hU0ArVlHeNAF1TnitJf411xtY+HeCvJCPUgorugw+tLFWgCY08wPfDT/y8
         PiRa564fFwyN9MXj0oCzRfKMlBG1hz41DALQDzkfZO9LOz2kI6lYqYmj3wUGL4vruXLB
         fxT33xeAiV4zySmOTQQxVBv74YizYY9+lG148KaN5/dmh52aAgQcNAryQYe5EfzIyWS+
         B06BS4y4FDWA0N6TN0SIaWgX0lAxKoLJc7qkx2j9x4FYXPCR8vBQs164rVVzEEDxuH2X
         V/21Wn2cOiXB86jcZPUUN8CFEt/fONEaIhY60d0hxvGll1az+GKI8I7toswA5aCR+2uw
         bGWg==
X-Forwarded-Encrypted: i=1; AHgh+RomZ+jlAqXA+89Y08wfA0RG0Lcuc/rTIGBY9Qu12PnF1FGEKKOOd9064b/Ys4lw9m1KXRMTPv4Pqfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyQGnDhEg+47OcslsWsKOMxaT6HSVMPQh6EebQqk2nOeERdbr
	tAkj2fVzskbKI55mQtczhDn2kjk7v1kYt1NJ4MrX9NJ2Y5c33iI9S0EIDQ2Pm1AAJtyiUHrdrC4
	ogau2Xv6jYmGMlbRHf2OX6AgdFia24QGYAVfngLfKfqAHAiyYqP5X3OmcyUMAgRc=
X-Gm-Gg: AfdE7cmyhJ0ouOpvs0ZpfbFylYm6DCmSTajGtEWS4inCmkhL+CaZSZBUPE7FBifo7Qp
	atXBVuOlXmLb18Nd8rMZ9X7hplQuPAcWAZnlBNF0xVNGVWwGalnyKAGepw342D0Rwln8yLI73aS
	fYmJgFUPpC6oC7SMzz6/u0WihrG+U+g+4YD9Qv+EVT5xwgXzMpnpUuhq9mZp+fcERPKwYR/fOqt
	YZywcHDfl6isF09QEvpM7XVgmvdzYlqAdwH4giA+bNcUL0QFNNyt0CcStNJE5tBRDILiz7BT+U5
	/mGT6XV/wtPQGZ3AjcQTHODFna00NVfqQyk+sSEogqUcV1Pwj9gSOTLMW6ucLHgIlt+aYOnS0OH
	0ZoIEk0q5aCEOaNob20A+zzRHbY5o78iqVfkJuvpBX8tH/jUI6DSNKSVjAw==
X-Received: by 2002:a05:7301:a84:b0:30c:52c5:6e5b with SMTP id 5a478bee46e88-30c84dd56f3mr4635431eec.29.1782446013640;
        Thu, 25 Jun 2026 20:53:33 -0700 (PDT)
X-Received: by 2002:a05:7301:a84:b0:30c:52c5:6e5b with SMTP id 5a478bee46e88-30c84dd56f3mr4635412eec.29.1782446013099;
        Thu, 25 Jun 2026 20:53:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm12919939eec.5.2026.06.25.20.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 20:53:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 20:53:30 -0700
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
Message-ID: <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAyNyBTYWx0ZWRfX3YLUR00t5gU4
 Gks3+z6S/MgCKfIniNPgBXXu2Kb9060mSiJb5QmQwZri99FBopNGOx/RVL5TyFW8AUgYTFMvxuD
 Yz/OPLpBig05zkGLQ8cby5mUESVvthwWlRHGp3jYeuqyHRKx3yZ2I5ngKWAZ+WKtXA00E5ARCzv
 rAV1PtHrGG1apTgHQzatQUSi+kURxbhdch+htpGKFjZxO4ipucbVrOp8oqN63sA+PSzmXAz0I52
 RoOGXX5ECh4vLpVL/RexWcOpOXCLTmoqoKSA+zKfM1DKKfE02f8FtqdIgYp2Mo2iHZfGlYmflzZ
 c7RkGyE8q8Jp8Q0rD1NuoUjgwFP49GOVlKEpsNkVJax/Mvv1F1QsZvdlWSbB/bBJSs2XzEWW9Fm
 6uCf0Pnahn7tupPPSQJcnwQCT5Ra1vTuwbegqs/IT3qnwd1bAHDp4BJxq+H3BwOEylHO7E+J5RE
 z1WAOh2wh2je9KLJUuQ==
X-Proofpoint-ORIG-GUID: ENKArS_pXqzaJvVHYxQ4FXLjm0ZyJCM1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAyNyBTYWx0ZWRfX92+kfd9khyuE
 BZtCLknNeut0HHvBjr1Dth0KFPXqviqmUkuGvIg6OaDHjTIwqFPu+MNt/5wEW/nneBj6co6rLrB
 3oR5hyPvC8gnXeEbgG+n3XhwS/8HZqk=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3df7be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YMTeiiCDW-xPtgyhEV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ENKArS_pXqzaJvVHYxQ4FXLjm0ZyJCM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260027

On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
> On 6/22/26 2:49 PM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>> Mahua is based on Glymur but uses a different QREF topology, requiring
> >>> distinct regulator lists and clock descriptors for its PCIe clock
> >>> references.
> >>>
> >>> Add mahua-specific regulator arrays and clk descriptor table, and use
> >>> match_data to select the correct descriptor table per compatible string at
> >>> probe time.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> >> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> > 
> > I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> > require QREF. So I didn't provide its structure here.
> 
> I don't quite get what you mean. I see that it is there in the graph

I double-checked with the HW team — QREF is not required for CXO0. In TCSR
HPG, I think the QREF components you are seeing are in an old version
diagram, but it says the QREF for CXO0 will be removed. In the updated
diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
from CXO0.

In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.

I also compared the description of the TCSR_CLKREF_EN register between
glymur and mahua on ipcatlog. Unfortunately, only
TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
this is because these registers are not documented well in ipcatlog.

So I think part of the regulator lists you commented for USB instances is
not required, and their dts node also can to be changed to use CXO as
refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
in the diagram. Can we leave the USB regulator list as NULL or we just
add them as it is harmless?

- Qaing Yu


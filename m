Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C831E850
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540979; cv=none; b=QxQfwlj/AduDlvfEHo5NwpsJWFmcQCcwTrJDw0gI3qsRxKJhk1IjKmWi+QGxm8XIAdcs9pBZZFjb20jB9RBCdnFNFOuf70VKZOArWv45YSIt985PtOlvNufwueImC2uRssnRciGzjjlIHwkCqQwFmcP6xZ67+qKRBOWwOh4GpQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540979; c=relaxed/simple;
	bh=ew9uwciLzf+70VcuN1RrFEQC2tUzp5KQFWMO6L9R5BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoXAymiThebj2sPQ3g5SMQCeQWEoQ+CIpDrQFH9x0LgYYWdccJJBgdc2SjtFKZvFIPqNkIbAgZU8T/HBkUJrKi9HUoja2K35E1NDf+PktIz1ku80OXC9Bo31QaZUveVhhgy3gfW78PW2XfGwfKSFrEozczWIdk8Z8QWyhgKWxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lK2W9hql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1TaWJNC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lK2W9hql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1TaWJNC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239meNS3099385
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 12:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=; b=lK2W9hqlq9NQpHKO
	j6+PqyxsfrTcNUVrmSY/G7pZ0R0VxkHi16XgNJ8z7HVEOS0UEnUyMj79ruuw1Nyr
	jKzO4sUgKF1vdtUE3K1g++/V4rIYesG+LrMjj5UrVXD4oT25YAgoIpbkp/i+P1nK
	O4+hmxmVCikWkzFLRucws+OGH9ZfjLblKT0Mu3gQERlqtylqCeIj6nqUriHdb/AW
	TxiEgAZre8s6ebCYXm4/WMYipDkqy0OFnNnyG6X2iTapPvqaDyEFtoGsfd0YMltd
	C9GEwhY+6ZkGqtGvtxOuDo5F+4Xi3e1R0LsaJA7+s2J/zaVLF7D0tqf35DXf78hR
	cvi3Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu0v3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 12:29:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb37db8b79so4357987985a.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 04:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540976; x=1773145776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=;
        b=K1TaWJNCY/z6oHJ5Gpuuyw4Vsv1V5oYZMdr01tDkx0qRrzh3YVRluI0uH3noR5Alqu
         5vVzAqi+fsz6Z3I1nYrnrf2nyIizKMm/l3BAHZxD4g+2c/uUsofgT5NToq5IzyEHZJwn
         G84+EI5hWhL/bgi+KhPXnAxxHo11CBQ+e3vrHHIIFhgjUg0cG/SqdeHDrU2PY2uKgfuC
         vqIbBabCpxlQGxosYkXvERumuNtGiBhng2ZyVwhEK7k9VbwfT6r8LiTdCW2OszFnDFIJ
         v5a3JIhbfhBweh+q/aETdvg27prx86D9epEa/Bddn7T16v80gwaFXHDLdlcjSzIrWkVU
         l/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540976; x=1773145776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=;
        b=ZWSoHT97InAPymTFO64JuAr3Yd6s06h7li1JB7fuAKImTKLMaw9TMUGh0GGaveE6AW
         jaXYjNlaOx03tsRkSPvmApkkMv9F5Gyxt61h90nhp/Ez/hVPUDYYjTpU7jQhVAaHRWDG
         0M19MJKCWd27KvJS04gA321BPEsl8K7xgRTp2JmNiDdFXGuOzw0jN3TbaYlYnfTUZoXa
         2J79nFH2oWwlvH6/6xab4GBF1GbB+taLCM2pXfHuZhNi+vbgmyBXPhJ04SgloW9hJSm9
         v6lA0munRWFOwGvMd2MFF/Sl5PiyURbjsrpkZTCPlMU56LFR/48LZk2aork5AjjYC/eF
         +X3A==
X-Gm-Message-State: AOJu0Yw2WbFaRXs/HLqJDMvgX1aEvtEMF2erMvwDsQNYZfINqeXy2p+f
	a3aUMxW2zF0L4Sg1jsJQiMfMrAaApuQnQvI3gNZgK+J7b5XYBk33K+PMYuWcAxNeYguMNJeYysg
	kOik43gG0xnAe6l/cau94pu8MS/E1tfhbJqaXuVVeOOV5z3EkshNBhgT7jv4F7r8=
X-Gm-Gg: ATEYQzweJ4LSReDckK9jrQG2x694pJiiDkhpHryPyB7+EStf9gSIvz9D7PMyhZoU+v6
	S2+Q9jWXA7iGyF7bhefb1Xy11suMRekBR7mPLIfn02J1FXA1IXyNDkm4l4Mrnzr/HHPhHW6Gxpg
	U3nORaV+aaIrdBBT8ssbIr4PqC2ntWmoj7wxl8eQ+FQygB3dKSV34E+o0SmtZ3MjtwDU02IL/ku
	vJOwtsoWGeZFy/lUpLQzmoxrUlWIU44vDleqoIMcRkF/mgxuwEYqoKQy4Py6UMuRf/XezQXsF6i
	M6eOzkNkjeDUpGx+XXWy+MpTFJg1omZzOh/Tq++Xqeb2sZ/rRpO8lUt2l9uxq0dBiZS04zP0eFK
	Qn9DR8vAM0mzlca2NeheSnEL6pv6AgA==
X-Received: by 2002:a05:620a:444b:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cbc8d6f180mr1874330985a.10.1772540976308;
        Tue, 03 Mar 2026 04:29:36 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cbc8d6f180mr1874327885a.10.1772540975729;
        Tue, 03 Mar 2026 04:29:35 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750701sm498035965e9.11.2026.03.03.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:29:35 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related CHECK_DTBS warnings
Date: Tue,  3 Mar 2026 14:29:25 +0200
Message-ID: <177254093027.989057.8587839568838242001.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a6d431 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HS7iJHYFZOvZgwlv4tsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aaIuJrx--hSqINnIIAwZrbttQRbiqSjg
X-Proofpoint-ORIG-GUID: aaIuJrx--hSqINnIIAwZrbttQRbiqSjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NyBTYWx0ZWRfX7pNxza1JBNlu
 Bvty3WzgU5Xo2YHpj4+ZCxLrjxZQgCbX5ikFh6jQT3yAhqRpdSAG74vHgrj5vasKDgZa1tbgHfz
 CgVDXzDS6XdZOanJv1s7bya6kY/+fSruGXlJVwVcPLi+jAkKOQuerBprJxIdOp1SmAoXILH5UBO
 dNWh0VzZV6MC2jT6tTrD/lzC/NWsImAOjtKmwPhLc2UQo1JI3ljZ6rrv6v7wm/4TP9qAEK3ZLiD
 R8Fw2vr4lp3l+wxBT2w202Bo9cA+LfiH9BdmNhcgKhOT6lVqgvGyZv4YRIbXvi4jJrGo8MfZV6q
 yVMsdOo1n9eCDgRJ1GWd1NMl7KXts32L4GXvTmcslAFkHmUjCYSywE5+4M0IewsvLFG0LBPoZ/p
 xUAC7WNwRz7ItATSNSN4FtqA6UUkbGtyNqbFIbfAYuWgCKGkRG1nHrwYUVldFNaWrQj5boMtuHu
 ALvqKnB+nGe1PeicBDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030097


On Wed, 21 Jan 2026 13:04:14 -0500, Frank Li wrote:
> cleanup imx6/7 CCM related CHECK_DTBS warnings
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
      commit: 51ac0f4b6d5f4965153d8c39644ecfb228480396

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

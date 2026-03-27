Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584273988E2
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613640; cv=none; b=HuxmMtwfr6iH3SkaUcpxlwgAftJ02lPo2LS+CCfHX/fL4fIiSijwu34+QvmWyQjzlml9c8fb3HuAEUhvy1E7C8cxXY9Q96IMdgaIS3aYnEnpKpEFKG91oCe68iXucPOudSC9yXkcAlO7WU8bQtlPFF6L2nQ2qnGPDyyybdWZXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613640; c=relaxed/simple;
	bh=YNvTTlq5vkItMcCXQuT/uFo51kQdpZLWjEa5KRc3EX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PslgAzcOpObvr4gloYQRcZTYPIaWGYuwJCX+c/jnpb2d7WltadE85EcqxsvAfWmjlMGAjAbP9NsKLHfTGoX+pgxaRzU+tGTqmzoJL8jqBG8lv+8PySGF0Y3AiY4fw1BYAn+uGx95PI5JXi8uWog3MqX0U4EdnX3d9eS3m+TEKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/1V81IR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyzTlwFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/1V81IR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyzTlwFM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vinF731331
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/Y8f9F8d6MnzN/Ao8fr1u/+8/IhBITpA4ZYwD8uZcQ=; b=b/1V81IRWGnsnJZA
	t9AB9AsGUNbWiutAFbSeh5T5AaHXTl2KezMJhRxLc+TQd1NyYCexK/rBeaKlx1Tg
	2Rc4wfSm3GQVut3Yjjv7BLAZne/feGjv7C3px3ZMjn+fMTraitSsMwByzM54uJJu
	hAL9mD4CMPDj/Ev1ttGFXyy2MqO0UjHg0/P6wBSLKqltqkc2NJV2Y0R7jUJvqVI4
	gJXDpC9LYpxbKRnjFkD96Pzke7WY+mDNAFxlDlL7xJsw3rHWu4DtpjSmfs6ziDLJ
	0aMGwaEzQXt2f68xgJpbOyuAyJ91z9URFNfTZdT1dCAhbQjowXniZdvr50s/iV78
	rfssMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q39sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso59813071cf.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613638; x=1775218438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/Y8f9F8d6MnzN/Ao8fr1u/+8/IhBITpA4ZYwD8uZcQ=;
        b=dyzTlwFMLClHDs/i5FqVjCIof613ZQC2suzDkjGjv0Dvl7Zcy5B1Msr9nayDNkiBkN
         kdAo4SxuwUN8U+I1yn259S7+5AhX5jpiNJSLxRoF9X3r9aCDCMm6lOWr7wzlcq1QHuJT
         fF+8/TtbuUgRu5w4cfRjXOGPCIQtzvHdwrbL4GFzk0tO5p38d7u2l23KnB0zsQocpNGd
         /K+sUu6rT86QnncLrfoyXNTRiEuWBIE+djGPlmuSoqKI69D+pk7HqrbZTnR2sLAtoMLp
         mtf6zMzvM9Q0iB5GmJv7yH+4j3s126xtxWfSfg+3Ovy/una8reifEkRzbEqNciGx8RpZ
         xBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613638; x=1775218438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/Y8f9F8d6MnzN/Ao8fr1u/+8/IhBITpA4ZYwD8uZcQ=;
        b=O9OjsGoavxHoTt4jHzdZ6j7WWdBgZYc2Q56j7WczkkM2qj1zsqERitOnVSMpGN1O0X
         nCK7IZxAsDtSiSSI+54PJvsm2NEwi93REqq3JchPj7uyZoypIrb+uiiiGFtyCL+Dgpjv
         Tnv3lItWqEcHpSg7kOugDJFWuywBHjt+efv3g3DPHzHUMg4FiO4Mb5pZA3doZHCLnKol
         CzHB/N9DM+EOU0TLQnxvrPlPMchbzMGNI125cq2xZnoMpVzSHgbrFwLX/FVJUaAb05hv
         /ffMvbY5jo1k9gjx03u4sCY/KfEXOjcLX3Tjtk/Js0WZXaq+UPEee6UUxW2F1iXYFK2l
         8JGw==
X-Forwarded-Encrypted: i=1; AJvYcCUaDyqxKIZE0MgPtzAfmMovNfG192yScji7cDXlgrL75b+0Af9VZGxu/8wPvnflaxWdHtmoeUHPr1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiaq23Gw/J7vM5tuuXOayFYxFP+ufAWFkKy4OYvpPm1mg6Iiid
	b3RPJZRCnLgANcHEQVwomn5mdYNSBUGgdPV5mIHRwenxGhurOgGqbSM6YNmGGUMJvnYyVO6KC60
	JQSexAu4LagYgPw42dSYdjJlnMbzP6HR7+DblHSeM7zU8rkFI5FifEgdJiq7wlBNXz9X0yR0=
X-Gm-Gg: ATEYQzyMra/sjVyAzosnSpb2phFOLTEnNkGH12TMCrzdZBpTvN9FFmd7TGJDkBvT8cy
	FG+XALH1KbIG5gq8PnExCrRW9wakFxNCl0e8JpU0SmaCvKfpnXnAbhBJr3qyrzrzY7TSaALOvnV
	iiktZgnSpinOLaBfUn/v2gwFutEO+7tcLnyozfzPuHREKNqvMgLgubVYyxcF5ShWQ/eD4dKTjK4
	OaESuUWGQriejsTKEcjwqP78h2Z3MDIIO2wdFipbkWN/YorsOZnb6vRhIwZMdQ/ChtYpqw8Noyl
	7FHpFjrQ+JczVDiBETrjuadsT0bqbblYdftqJH+DbkoQeNf+n6vgb5bDDM6e0WWmeKOVEdRC65o
	nZYb/fXkWbw1/11pRcAAWqsCMdj0=
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr29836601cf.16.1774613637566;
        Fri, 27 Mar 2026 05:13:57 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr29835971cf.16.1774613636981;
        Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:13:41 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YNvTTlq5vkItMcCXQuT/uFo51kQdpZLWjEa5KRc3EX8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR98TaIEjadrLY9rnUrxzDBIaaL9n1HGicPN
 vMidT85z7eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0fQAKCRAbX0TJAJUV
 VmBtEAC571rd92jiixNzGpJXLBv8Vm2mj7oP0cUrkFmL6UYiQEtY6k1BoujNMd9BMUyC/AMPy5m
 6U/weKeNXL0Bo7HQdV/J/8RYw/911bA3nqzQYGKswzP7nxTUneiGLExshnN+jbw8fGe2DgsxyIq
 cC+BNvjDOUS6RpwcyckvUGeQ6U5oyRysz4NH+9EfhalL/vZgKThhVG7J7Xrb676CJZRjTtrKvsG
 lesqf3PUmmR7vMv5Nu4kcRoni4bba3KGl/4V18VPNqIHQxIWnT4GZBrmXOd7NEhoPBhWN6O0HF1
 7ZQW+wFL17KF597rCSvvOwmuKG6eGSIIrUTzOwtsXWqPqUawKF1bxglXEg4AVX+4HG8qZMKyTZ9
 vuRSALNBqtyS44PyHnu6ApWLtZW1XMINHld1t2uwxHNSfPG9s3qnCJsECqL2LtsZDzduJq8sjMn
 GbE7FGAsennCCKUVd/sPD3I/CmNADzXRvcNsznpRetnxds+VJ3eIMzzFrwHEfCrWqeU8K2HMyZy
 d6jQMPCdBYJBi8qG6FCFPvOpBbCx5gLkE7aXDJ+ouCNV/+6T55mFPwW685k4kcpVI4Vp1GYlmqg
 Ufw5lg1crCl7le5uq+T4T5s524REHG+14uZ97Xawv8yB1PgoQRwVGNZKw7ei1oIJ0u8mAqQmQQd
 Acq4TKSyiWdYCRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: KS8gXytx4OLSis4AdePjk8kSZBg8JyNv
X-Proofpoint-ORIG-GUID: KS8gXytx4OLSis4AdePjk8kSZBg8JyNv
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67486 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yTESgr66MHD1aPHvgagA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfXx8yvosIAFeHc
 2NvQcKZLbnl94EMcIrveYmr36Ic1N7JNdOCki+tBA5JesOuLoBY8GgZul0NfdHIbJM6xJ7VfXc2
 ye0qr1bruNBENuxjlXxphna9bFHbxRLj03BIhmqDmTVZDUul8BvPlJFXCcxc53Q3OFPKTSx1m6X
 0todOi4KiFODLTdSl4gCvDrvj+Y7VJsbQ1BWBU1CDZJe15+AZ9UD4hKUnH+a0v3i4Dpm9EYqi9g
 8JRga/RW25m+B1JWUUcfVHK+h/oVpS2D/RA20xOMrJzfjS15r1vzgVtGdDpJwVY3T8O33VujJdg
 uIKP0hgCyJ6ZrshsaeV2NID3u30FJqI/pXxLAeSz/yp1elvkNt/I6/jgBm50xZvz5ZoJJZj+AD9
 7TN1TEEd4tIlJ7NV7PfpeitY4blhtqilQ/98vpKGPE4B76qJ4nuSSrdAg6dZNBEq5WMqlkjl69m
 Pyuujscl4UaBMxRi2eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270083

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 67f8ef4d524a..eec82a69ddc2 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -804,6 +804,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1


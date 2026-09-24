Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8249B200
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246530; cv=none; b=JwvND6Y31j+Bk3RBy4VY3/ibYSxJB/iPWjXzwHh8BfnzmD7vchgrlFx48m7tb2UNDr2l+yFS5ad5XqnWWULrxdD/WZyb2n+XuNHDngfyrYppxWQfzL4l/raLVYlZq+MPsOoSFsOotoAOiQwKnrDIpc2QFCEgNX/cTpGmDJiBDfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246530; c=relaxed/simple;
	bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPgZ1HIF07EOFjKfZyuqY0ZxniUq6eKzvjgXxVMfCH2gByagWUn/bUzytGpangoQzTV4tUlIiY/G09bTLpFSK2nTY8gNrwFH/ymURN0rCk/YEbtgjK55HGEBdxkZs/lsNJiir98Nk5mL/xf6ZerzyhpUFAP5dqLBN28MHKYdPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEzY9+p9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj5jcw+n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEzY9+p9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj5jcw+n"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5LSO1175624
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=; b=KEzY9+p96m2/05kw
	3M+IS3GcTuf0aBcCR4tU9rQHZFAa8sstQYMhqJRIMfVgnpk8TgYOl2/3x0RDU+SJ
	5wqSz/OyDRAYaGKMIPrW7Scs5jxhjOIIkbgGrlzrUxqOh3oEKRZzwm8mamR174wT
	n6Cq5AuNLCx0rouKhFF0olt0+d9ajgu5w8ki5dSlaWgiCNPjeguwq+83c5GJ8RvS
	ELMBZsjqYO4cRx0hJMz3htD3set1yEymmLq6FiNPTsVJBxNxYVndWEU6OuYDoA/Y
	4AyA8GLEFepHdlhyVFm/E9jODG1demyCs5bnVoOEY8w3wQRi6c1ETw52kCV66kyO
	1XQUYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r49r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0c7126e7so308698185a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246524; x=1790851324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=Qj5jcw+nDiYlqdyx4vZeAd5i+D+ZG+wgjNjwWkyEW6o2wi00I8+gKAJedVjJl06BPb
         N/oEAvXAdX5+6SrMDrIUSjmRcV5J8sH+LBPaRZhYkBZ/CqJ880qzlmetLi6nRGvRQLgA
         FHIhfJWOWD/yE0ArkJBZJy1W0QW7rh6KTP8lMmLv5YKndyVcniQ03NdIDV+R1IUSeMTk
         qeqRq6lhAD16eVCaepOt+7BFOKqZVv2HcZ3AUpVuyv3ecIQL62wDqSmy5A75nK8mHOPy
         R1K7p/xf9KoWoZzdrRCp12nI1vMFQY+FBBDThkZQNhlr0C0pIESLLF/s+EWr7IMXE2Cz
         HEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246524; x=1790851324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=KiUTKtt6KNBwcrr3jJGJA+hnJmcrApZi7HRmYn7X17GMle5b//Kyz6bt9EObh1byc9
         YwtYNLq5QajVaado90nE9EGxQJbNzIMmQV88P8lPwfrl5SoBIbZj7sDh9B9SZG9WyUEp
         NHi1LoE566rllGbypH2Zw9cKXpyqfHGNDtL+t25Vgkrzo6ZMrQWzks5DqXh3HSx2r8y6
         /pd6vsypu358N6IL+aciBXGrkfoz+H+6XQyPtJlekePk5MrL9c1lz3wyCKrk7LRvjBDK
         TO+ft4YghPWBt2jwtc+FUNDOI0WWmSq3pTL7joZGGOhXHZjcJi3ufZ3yQS4tvgvOOkab
         VtdA==
X-Forwarded-Encrypted: i=1; AKwUvBwTOi383DnnE9ol3JhBvmNu+V4hFoWw82vsH8C0XG0cEvsCODYLiuEsy3cp8dnSyKib/BUiFfzs/h4=@vger.kernel.org
X-Gm-Message-State: AFuF++nFORZlM2/AlHXqkBVCoXQfuOlbEMHnNBr864lS748BcQhOKLbU
	sxTtzsezpCdsCc5piWMaYQIrKtcFBIM2q38fePhnqY2sUIb0tX6z01WHMKI7pMr5LUuvBRc7Rha
	j9dcoBqmvY6YvsZbwy0NNb0HSUUkNcaE3aVCsmnP2Asu2FBnhEx2oAHrCNP0bUCU=
X-Gm-Gg: AYBFou0vsH4OfLNBD4h4dT1NFJFiLlXRyIIHUSXLSuAe+6fmfSM34+vSHrI7k0MaH0+
	CcHu4dDW/wFeGek2AFd8BSjc01iXS8PD74lfIAV9WQFunITYozAteZgLm2WfgyFwvEuLkb0ixnQ
	KgKVW6zzvHoDx+1ulgpJeat5M7c4NBHAgnU5EjM0WceMr5t3gsvBZBzpfrulzwwWvwLPhLRDmYQ
	mE7lCTQcxIlveMTeozyItYLtgdPHmIKRIiLcRuRtH9tG4CdZirMKbxMdeR7ORBK1zd+O1yMexus
	MJSVPyyHTY74lz4AHxA1nWM+NlorUt8ev+i/yc4u/KATL73wOPE2UnVW8aRpUW3bDsCjTKy4bDB
	9PKBNCPz6
X-Received: by 2002:a05:620a:1723:b0:939:ef88:4af4 with SMTP id af79cd13be357-93c362470f6mr228658585a.10.1790246523993;
        Thu, 24 Sep 2026 03:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:ef88:4af4 with SMTP id af79cd13be357-93c362470f6mr228653585a.10.1790246523355;
        Thu, 24 Sep 2026 03:42:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:42:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:58 +0300
Subject: [PATCH v5 42/42] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-42-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4CEcQLHpQHS/ss+HFG3cmzLfMFplWfVvXOt
 kxURLroZqeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AgAKCRAbX0TJAJUV
 VpNEEACzbLFp/j6k/PIrIZPYr8JSiBYM/EbMa+Oy+JpoDlTaonnJvQfavo19r4lbPH2jqBBiMM9
 YorezzSh329av+dZNrn8+YjK7Ugh+i0BXfxV312sjyymdnQ/AayKba+yGMR6Kp4wIwasvtZuTbK
 psgUa6jKpYXnuW6FpoGdh4k+Kz4C2+u12WE4n/cCKasqZAtJSs9f0NM6TOIU1Jv/kj508Ex/Xf2
 etK9WKRQPBIPyYIN8VeE6UsmezEMhUT9nuLrv5n5K6Sh7te7PEG59aLCNwdYaSBxqBDI3zrErnQ
 Vmi49soE8QCZND4rUZALqrMGNgfXiGbsqIsLVKFZQXxWnE89LwdyRUExcWdjdN7ZuKgXxDHkVg/
 SOcfVJiKnNKSXb3iz6ijFFDz8VFLwiLB6QJUpsBf/QW00GRIHlbzcAkBC4+GDpmzCqT2/2NZ+Zw
 83v55Z4ce9mjLYgvRA6yibfyCo+HFytGslkG/wgX/KSpK3aQ8YT1Iov/xP7bUlgnanRNg2RHzq1
 UJGi4v4wDmIHtm17oDkR5BZFj3TQgATb3/ux6xeRKEUJmlcq9CzfXrxTb2rgSWH1Mf4pNkiZLc9
 I3F7hOs5emTZQznX6pVmWO2OK5amp9pruIO7mtdflgKPbH/dh6HDH0tG0OJfgd+JQm+kGJ7HhaD
 R2wMOdzDsTGxUxQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: MIEWD0aXg0IuZpdsXq7paiTv3YXO0_V2
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6CcBQu94FgXi
 GwfGMXCdQiq240qXkc/0oByNJJnYPaIdXfJSnGep3+foHkXtdNRAGoo5jA8ImaQ//+PUwULSSLE
 9IcCDc60BS+TaEJsgffGOi/pNb8ffBccp7q22zyWYFOdE5u2AILijmPowGDCI2F9eVFRWHLgqS1
 tYnjpkHK5q9Phxjk8ofC+hM4svCjZX1QqWF9qb18yrKR2ORhyDO+I2VjHubKYShb//ZoB5PyEr0
 TEyd/ptrwY5rzpnl6ZvGVzIhOREpJPBVKlkEN5x/mQ/8AgrhLghDRgCL55dsC0I9stbCBY8RBPV
 s97YV6jxrF3MecsIjyQyFzhL4vF9pOgwE1oSXv69ZwSS8WJCgsc2HsjALLq9tNsqbf6I40QJCFk
 2hDz+3Azm1oVpbQbZy5k6V9UAT3f1AWh9J5t6MLANWY04Pq/T11Ppjwg4/FDrAZTImaGQbQ8vd+
 /hSrMW9AwTX4kqLARtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXz4mOhcEAqezz
 gQoDwVZzj1NfR0yA476BFGUmCxqBNnY37NTJz7fhRvDUW8WJc7XZ6dl3rlHop4bqkJapfN/JKlY
 bter3Mfn/1KRBiLxvqQYTrut+dXUDBw=
X-Proofpoint-ORIG-GUID: MIEWD0aXg0IuZpdsXq7paiTv3YXO0_V2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..860673697f1a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -705,6 +705,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0


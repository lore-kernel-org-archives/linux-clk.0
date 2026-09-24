Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A6F47CC78
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246446; cv=none; b=iloaeFGYJcO8ipYMqhSPKRiUDBPauwNMvYuqxqf9Bi9+ReC3tyk7l+ILqClq4eCD/Ii1qiUpfxqTph+wvPVshv9gF8dGJSmckeCd5wS9pwFbZf0uShcYs7/tvx4kMUGsuJn0tqClrJKKOdWadjooPd/YfxmpMl8OqWuV5EoBpQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246446; c=relaxed/simple;
	bh=EFsK9n0R2+OJsJWZeQla9kGCrfUJn7ULxUTxOYLAVi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGHwNKXzHpWHMaBs1NO2gJzqfVl1l13LXRkkPMmE2S/5HC7ImgocLHCsiUI0+6PXtLufga0PPKFsz5sUy8NvQ3gFnwelooOLWnOzWatZWX/sklHAajoFqsKfEE85lyPzIFC7vdvQ2PsKF54Xd896yjwBbJ+Ad4UBR5E4gSvd5Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDdq0Yx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1vS7DUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDdq0Yx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1vS7DUn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Phi31270223
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KirpJP5T9r6XG6C+4I9UduGnb2+4y9Vtl0tXv9XFeJ0=; b=DDdq0Yx1mz9qRTmy
	x/x97IEM+V+WQiX0CYYdK343yLC8PAuyOwu6ev6ajjnMUxFug4ku72XTPuqNhxU6
	/yZAmae4pnQAHwqsOuxrXf/D2eGpCDMhhoxtpEDxj40aFlV/IVZcU3CBHk9h+J6+
	vgJd1ijA+7zf/YYMPNMZvNdDS+Yx5rxQ8jD7raxNuvQfOJ1dciF+RTIhmLdxhYdE
	ebGTOpt0k+A1/ZNaTS37/mFJn9eQgc+dK0GiVSvJNzfStxUPNTuKLVZEYAru+eYl
	9etTGDA1Ou9KLCgE6mV2xA6QCv5VEWykWiQGDYzMNFvW+zTFyjO3aqckdaK/Hl+/
	Ch4HwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso324256285a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246440; x=1790851240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KirpJP5T9r6XG6C+4I9UduGnb2+4y9Vtl0tXv9XFeJ0=;
        b=e1vS7DUnOaiU1AxckvYdhEHaRNXvyqHnunE7g7oB81UQJmjqnPeOWWaD9moB2AkiI6
         HUdp5pVn0WUz3h8sulQdMImD2mlVKFdqwyRizUln5LwOZB07UxLCV4Fty3pPH4VIzp1x
         mIRpMfYyIbJ7rFrvKiwdRO9uA5c5aQBooICTSAAVNaB+oQckOObGKVL1bYwiQ3WEJD5c
         se8sT2P6vBUjRNO+KuLqtOGKuvwVNF37tNBgCPEbHfjxKwPh8K3gM90B5V2qObWEQVGA
         /UWELBSBuHCMpvqWB7rV5K/Wm6/9FL2pw1vN540hAgb3xFygoflhn46FD7BTyrGWYO2u
         LW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246440; x=1790851240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KirpJP5T9r6XG6C+4I9UduGnb2+4y9Vtl0tXv9XFeJ0=;
        b=h1KclwigCSYJ9qdIPRbf6KnjyYKtxCB7OYImK2D1QcE6NgilkcBCRy7db7kQoI9fYo
         6QfpHKx4H72GsSCrooFna6y1SXTu+AxXf0IvQo4QMf8YaUJ6D1DjCe1zkNNwGe1AjfnU
         lcChAO4VeRjOMDW8St0BNQkx9tcpyXHZWjsE+4iZJrhm+gPQ/VEeCq7frR53kudhbjjQ
         eqVYxWLx2e3bS+MCx9KOtQchMCWCkBnB6LhFsnmxPnti2TT9yv2MxbmrveOEN/TRUIKj
         o4rGqNRDHUzTindQW1mkRHTEuJEDy6JIjxPMuJaqVuLzOC9jTc+/+zo4KnQ8Y80ax+N1
         gKsg==
X-Forwarded-Encrypted: i=1; AKwUvByDgPsRA/pw4isoTH5dRQhLSaXS8xv9JRslPcM7Ky6TsLKeaGplAjcXWRv0lzE2GJf3WcO3qAJ0H4c=@vger.kernel.org
X-Gm-Message-State: AFuF++kmP53hg3CCVX9HPchVwR+mw/qEWQrWjq/t8KDYPB/N2j/h9ZwS
	Y0qLR376o6W0nEXz+d/SD/RRALMtVI9FO9Of8ALKtXWuO1e5ZDEIvvnaX0V05mErxjjO6tIKXph
	CKyqPak8ZiRQnDP+uoCvppXgLJrBgyUFU8cMZf2jOdYSw0XDj4SLjiOoOIotSIzw=
X-Gm-Gg: AYBFou2VoM/PYY8R4+aovTefPnabYMO+raeUQa541vYFx4U65at2/rcmDGEvuOEgCQv
	sUtYmsflLJdAO+j/ncdojeYRY9OvshwPK40EFwN5PiTxBMtC9jPjTVHlS+AOC1B/NofpB1UOyuL
	pNRmmyx6F9FquzXD9LGCUUGYJ/qf/w+eJVGuqvh06j+e520jZcNA1CBNyI29zpr0rj4Gl3DTCQ7
	UWHYNQOM7GiZ97IWb6U64+WsPvFW/YuT3i4rvjF2tq1SIHtEl0NYbSYv+aBoGWLE3hi9HJmVmXl
	UC282PuFtUElUVCkE2Zh3QwWqWnv07pFK97sGxDJMShYxnmUuGTnQjMRcxpGWdtHAiddvyKA0cq
	XuyGBDheZ
X-Received: by 2002:a05:620a:40d2:b0:93a:2e8:5afa with SMTP id af79cd13be357-93c36396033mr230392585a.30.1790246439999;
        Thu, 24 Sep 2026 03:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93a:2e8:5afa with SMTP id af79cd13be357-93c36396033mr230386285a.30.1790246439348;
        Thu, 24 Sep 2026 03:40:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:27 +0300
Subject: [PATCH v5 11/42] dt-bindings: clock: qcom: gcc-sm6350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-11-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EFsK9n0R2+OJsJWZeQla9kGCrfUJn7ULxUTxOYLAVi4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3k9KJ1e3g+V1KkNA4/Pf01Qsn5ZBxMIpqZB
 V5G0dcrxeOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT95AAKCRAbX0TJAJUV
 VteeD/47UV0yRVhld+/c9luWjJ+Oj4eyboxgjmXBAquUACTO27fnkMmMp4Isz2eQ6AmTsGD8iq1
 z9+TPaw+PslARaoUAjUDnCMMEqJe4xmyi3Zhp8u42ad8NYj+50vW8GDzEWm4icsgn1xJ6/vBUje
 yb4sufRtJ0DACXcXX2A+BAW14KJd/ruiBDL2cnRGV/RZnNAx3vnPytWn3lWbGdv7n5r0zZ1DbID
 fPgcF14hha/K/l771v63ugdQUxG9kiDk4b82BYvtyvDZ4C3Mt2vtUXAZpPFx/PgIPPdl7CJpfBT
 c0VwpT/nMyPzptfFz3FklmBMk7YvaJUGwEPeXAIlZ1+5iqOgbL1jZA9zw51VXZ9U950wk22IFR3
 +gu5ncQcbUFrctfDLkwn9ChMIgtF8RsTprglY3y6+ISTiHzQdQYYYtaIIqVt8ipIbObs6W3JAU3
 rTs/VDaK7EAfvVaKcblb3r3rStUYABmyPkGFzft8DpZ2Ok4h2MiLh2Lqv86w9gEdRzjk8haNO9p
 U/lqb1speDxyljw6BO9uwB0Od8h38AKj/VWjK6bjCTzwhsPF2n0K6aUqkUUEZpT0cIH5SSLqEc7
 +Vf197dja/Xl9Ufprhqg33cu6kp/bRA6e6p2AwQb3tYhNgR6TH3pCw7NjPNm9e9RK3moEHP+Nmi
 KWwxdLrClX7Ti1w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4FrbFwaV1HIt
 0CA+s64WciwmpkBD6R8fACj8NGECHDgmAVP1dMiCy+2sU26W8Q4qgMApDTCyaTNugDdTeFb7iJk
 tmcQJVAGKwSTt97FXVLriG9WNApZ9+c=
X-Proofpoint-GUID: BhVF0RcB7_y57imKUM3zt8hHKbm0py_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7yj6VBAf9gvW
 S1nrQCRBCwXYmsRklzhfLt1WMasCKzDoaWqiS2n7fvqgTp/3BL3zpFlV4GyQrd8HlZ0g2E7JI94
 /6k3ZmhuLwjB6ekHGEwvPMQE7qr/mFta/97sK0zmxwDnSRdt9D35x+D6e8MIpIZl6gpyTNDjQIV
 ahEhwAFPnsUILS1bHktbMtuM4rEaJHDEwzc1fTS6w9gVcYt0V8huwKctFGlMqei1GMPWOmLbMhk
 jB/RLkau7Nlb9pUxQLFiSsGrQC2dY1KLCH4ijTxone/4dYVLVqdFmG4ovZMiZYOJg3lSv4tr8TC
 IdsZAp3F7sye7eblQFf7tfksQnWajsXqB6ta8L6HE6iqQJbRR75QtndoevAP7rEVZV6UHr27tGo
 A7SLin5IYjXZriAaPuY1uCxH5oHz28VbHcMzxD3F6+ijT03JEabzDn4w6agvMZxeN45AhksSWyw
 AcOSibvxqQtSUBqpPuA==
X-Proofpoint-ORIG-GUID: BhVF0RcB7_y57imKUM3zt8hHKbm0py_I
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GDSCs provided by the SM6350 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index 819e855eaf9a..098a108b8123 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -31,10 +31,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,12 +50,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm6350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;

-- 
2.54.0


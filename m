Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E5132C92A
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144023; cv=none; b=Rp+/2g/nvGJOOHVmHFUN7qhtk+FyTiWDUilU/ayXlbGvPRTLBVAmQjXorwNsyQXJ8CHKkyZje69cafTCvbNFlucpQ0OrTExYCtB0EQTx2rUYAr7B+gvORoM+FpBZ3KSpS3VnwaBAZh/MuKhDMshY+SJUtq06ujLAXJ+gP0/noow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144023; c=relaxed/simple;
	bh=ZfMUu4gStjGQTf1ARp/kDn07RQ0rXubGcOAgh2EFVfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HX+T9hV4R7qJk55a5vQQ1UVcWSBQNISDwJ9ufZ8WwfeLUlTEiRnpavg4AcCiqydo9q12zhx1DBOD7BBr/mwf6n14pgCfaoGmF/JJlpkS6zKxRxw32BWnT0UOhXkmX5OPej5veflcqgYiA9gvIlFK1WwF0eD4GszyqlcNWqG21aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLTdRLFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3p/U5XL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLTdRLFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3p/U5XL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClFsD341573
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qw+QvvJJQhIEbjeEXUdWCIfWpCf2Igi4YvszgkY9sRo=; b=SLTdRLFUIUqZccB+
	0Tz+rldd52UBhUzQsMC1xA2tFwPwfKtVBj1MSEIICXd6eN+74wGrTgag7SSlCYIh
	DCWvhtP3SFMvTnvbppjaaJTeWBaNvgVbpTaMY0JMG9lWKMsQYKMEtjAweij6tqph
	B2JiYzBhwsY26t9u0tJQYW9xx416+T5b4apqi01b11lnlTXbo61eg2XBt9JPSoP4
	i4aER0toIVDiZP/Ke2nW1HRbJwqn6KoGqxeer004PAR8OMmzUpio7I7rdFbnUK56
	PbOtdmFjeRDhb6gsj003xRW7ysTgwblMW8qUM2lFP00BnEVgD3m16rsstU2/m7Dy
	hWbLJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb8t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso88110185a.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144020; x=1787748820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw+QvvJJQhIEbjeEXUdWCIfWpCf2Igi4YvszgkY9sRo=;
        b=G3p/U5XLpEA9rYHFQ73MGieYKXDbMEkTLqSIkeg1QKIsT36/+fytscfIiw9ftJT2GB
         TBuCIaEAtXme8H0qfRyHtaor3blWmmHFGnfR3V6rw2IOyymn1m4qgkJWtnz8NTl0aIUw
         cW0iKKLq7BmfpUbvYEuzZVfhqKOLyU/M1P7XID8niKHenEpt+xHJGNHcyQs9Z5hb7Bs5
         8+9EzeuOGsFvM4jRseC1UcOkuXxQMcFXZk0xuFMZNPviB2dIQOkNwvyRjVJfTuTy8PwA
         bNbsB8Wq9j1z3ONu/BQeHHd8Eg67jvswvh7Ca1yunnePzR66D3JOqNnY/Y12lT4OybqE
         CoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144020; x=1787748820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw+QvvJJQhIEbjeEXUdWCIfWpCf2Igi4YvszgkY9sRo=;
        b=qVKyLOi6iyMOx2iy/ssiSrQEc96tqGw0z94hJaCae/WKJbkcfbeMKDmfeEIQA98z+d
         Z+oXH0DnFDdoqnw6K3djhElKRrh3HsZzLPLDBOvsfmWAjDdJXBWtNtGXCUAJNbogbRyN
         ZZzPcJ5mU7CdAvQVKz6IPYur92Hgo5r51GXyocaSqObo5TG6WYPI4CyfuOQLXtXZhnG/
         0LGnKEgDf+t2fHOS4uq6jnRJyvpM53THFX0OCVC/qHjjSD6bF0yHXJKZX1IY+syrzIPo
         T2sIpXRZN+NV3dXQ0/XuY7Yo1eORFqWsaf0/zrIuzNPTPQUKn9XpXvaH7Qv4L0+Usd7h
         iNYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrekDz2M7Qk045HD95GSFs7lR1ssURdBwOcToWttAKl6r3xm/FwkN0sSTuts0ZLMFuzaGrGEMa7oMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwulrOyroU43UDEywLApAcb85wGzgro48v22slGRNHqL8YMlfUc
	ub5+Ri64HfyBaeq/zG3rsgl2b1FRcLxoqCb2QXMIfVNqrpAJJawxt2V6H8qYd64IOtKP26kn3EJ
	61EecUZ/6fLy01KoKMfpvoqGR5Uv+gCZromxp22SJJWBf9nNmoWSb3/32tklaU6Q=
X-Gm-Gg: AR+sD123VInoe5PSlCt7MbdKatITrkYTQNU6tAFj3MhsQHhzOV4UsaPRB6BcS46Rd9o
	kUnTuJj8FlUgmUj8gz0QNi+gJG5fCOPYcGYDCM+T2qKbOH4F0QckhcF3ib/MJFsfcBMICsry29c
	w3FfK3+QqqwkHt9JNZCe6MTBOc5c7G8QKGZVXzu4MmtwnltHxSS2ZT53wo7GSKS8b4YZtwMn6nM
	Lz1V8aFh5+WvSpMyj0OVN6jUkeP6J34mcjbILnKDxRUgi78BPcVdsF3VNGDC1I+H16iBw44DkSH
	wI3i2No5HKjo8oBZbWC+DBMzs+C12gS8auLdJq1bR68NoZej56znO4Xm8G5EIm5DahU7DjP1ZUt
	wpFicp/9D
X-Received: by 2002:a05:620a:270b:b0:936:6a42:fdd1 with SMTP id af79cd13be357-9371e29b04amr451308385a.13.1787144019904;
        Wed, 19 Aug 2026 05:53:39 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:936:6a42:fdd1 with SMTP id af79cd13be357-9371e29b04amr451289585a.13.1787144017991;
        Wed, 19 Aug 2026 05:53:37 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:55 +0300
Subject: [PATCH 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZfMUu4gStjGQTf1ARp/kDn07RQ0rXubGcOAgh2EFVfI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacYNqY7qFQD1v+MHzq4/LVH0VOstha8sjcBq
 FFaPQRwktOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnGAAKCRAbX0TJAJUV
 VoJQD/94Wt1a2I0HgIGfdjfYPVzn4PXqWan1tvMQeyoQuljUNgk6QncgcRVWR7+4ewN3g7tDEtH
 iLZtu/xxob8+DRvNea6RGcKsQC5fjgLujDzq7If7z59IczcxpW+BsUVEyJe3LROW7Dgnty6/wR2
 gQTOHtKxPQKvfsY7CKfd0yoqmQepc8D02kcx8uTDA0kyCt/ZWQoEy0liSD1dzOTv3I1i+NYzzX4
 +rBWdAp23M9YZUkx5JkNID4ERotvK29gaSFgP1erD0NEaHquNJb6B5Se2n+Xtz/mQnsayzqj3HE
 lF2plceesVYGqU7BcD5WNQMudqUj83jSn1dbDJvSPk3l2PB8aXOmup8V5+KxW3AjPnYM98i4ym9
 5L4mJyHBl88i6VnOAFO5KpZaf1/3wXH1/h4WqbyV1kgCZnLJ4zy/6HqXZAQ0m5CMhZ3AidJ5RDE
 pySMKiTvb4+d51Cj2qv46vZuz2TLQRBw6Gy1ePvVdRW9O2Yh7Siz9gsK0iQK85bpbDJcijnVGKk
 fURfxn9VI0iw9++pSV9tjqAWnU0mUMVYjEzyMFPq/dK7AuKnQb+VJypX3l2toXjO2WedX3Zspvb
 Bg3GLPfa3qOnp0yEnn6hOq1EWkp5i8xW7s5C/xY6jyUfAPwBqV9xl/xEvhZ+aKsKoFAKkly+v4A
 v5+x4IALckolWJA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: S-FK1S6Muqf7E0sEQ6XQR97ipKZBKVdx
X-Proofpoint-ORIG-GUID: S-FK1S6Muqf7E0sEQ6XQR97ipKZBKVdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6xQlaY+mbqoB
 ZvWGfaGHN4uKrsOLdoHNItHJ/U+NWM08wFqQrlMVGMmfSkPV20WQ221tJyDt0ePAYTu3B1PGYwR
 kKaR7HHQLhI8zVQvecdVET02yRtGJovOfcjOU6y26v84uScpLQJQB3G4LwAZMjj7E8jm60/SfxD
 c6eIQuXf8GvoIMuEbrHHX3QPwMo3AOiEMz4t/LfYbGzSL58AIx3uwOX0NOXKqLIWDNpA5blYwrP
 1YgyIYk7aCN2ahCzhpQjgKk9eqYOy50DfWtXzZCq/is6jJdc4QAT2aGFTC/mGQvEV4wHVt1M6ya
 tPF9hP/dulsiStF18AzzD8B7HA41iIgV4XWQheimQXISA30x44WQfsznF+pdG/Lr6ljdo89F5iD
 UeQagd26HF2vbI7Xq5LSy57s84CAtASDUco5xaDdWv0XkJJzHWg8sx44xzMvSiwBK9WwZLRlLL+
 IlQSTy1NdceXRWiq/6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX0M4GEjXlSWdb
 kbXMv+YoqH3of8KaxBWnvpPOoJF0OEptiJ3ujyjb3ejOXvnC4MksM3C/Yj5PF5vlDnRl7NGjt3D
 sEvU1BI2/jNdbZVlc6CQNXz7kyCyW0o=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85a754 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..84012a407c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0


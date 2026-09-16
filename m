Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2A4BB5D4
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552922; cv=none; b=i1w9I3pGU3HH/aBTuLq41Pnxjys19vA177DE9u+0/dm2ouOPu/DSwv4WfdcOZUWiPk7tmcyWfX37YZ2dHuspakitFDKAE1RwpxBKsUj0Itf5SY37VBgQWdJ/lGodHKKn3YfiHf0ITLtqnaJs08XrD6MPxfIVdXh9C89FNPCps4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552922; c=relaxed/simple;
	bh=je47a7jlI+rI7fvwiJQVwy1hQYEmz88kJyW5vpEN1rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dG4ej/rKgCTAnIFD3xdJgxhd4PEbojRXh1gs8keWOwhd8KquELa+SZpwOMha2033gpWzg3CuH7FvYNOwLDeUvXZAPpdtzfFYodFilbRWdJ7FlTgCeq3dKJtsGcG3HBCmTgAWYhXX80YfRY0PkMAkHf4tvBVAiLiP+cszu5sm7d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXS6SVX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr82jEo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXS6SVX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr82jEo4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92f4T2348123
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7//tLcxJPqzMOHfjhQ7X/f
	v4TViekpIWdxqhuUu2YIM=; b=eXS6SVX8j1hoDSzpD4T3eejGBQFcuXUHbA5hae
	IAU0WUGZboVJsO8kpw/Ia9UKhHrgWziEYkaxsIyqpt8JQNheBdjxzeGgwO0tqz66
	K7i9zmGq+GDCf5KUQUODEjBpU9m91inzLfT/f7VlKtMn0bv620s/Oeu5vBlh+rYb
	nVhJc43DRDKP/bGWbbkuR9IiP2I0BpK70Q3LkmIr4Cp+abqgM3/cSfZG/dg9k6PG
	QJXHMSdpkJz4tpJaC+C5iSmMbMfSw86lulQKfyuH11+shRadSkQba1OCmnyc5xoW
	nL6S9eIESLYqvdTJOCyOQG6L3qCxqiKK8nOZQmxSJ89dAodw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywan0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:01:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a04805f8f1so435347137.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789552901; x=1790157701; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7//tLcxJPqzMOHfjhQ7X/fv4TViekpIWdxqhuUu2YIM=;
        b=cr82jEo4UlInRBEqvVnXLgohWyb6vlGVQ27kim41exQi8QsWhbPnQF4yOtE12urdNd
         zuleNc/xsP8wjMSjhNGK9ioKr3EeBYRmEr6cS38QVHNup3Yhs7QzG32zk9bpX7Uc+OP7
         Z3IDWUt3kXm3BPZfScFglNDxnKv+F8XFFYv8ZANmdWXwkOXZXHkJchqLi3xnKw7aVBHE
         LYbxXfESgZLyLDVdItDQO/dGuGYRi5Bg3K3wD5yiAW+EVSM2ipdm7pWE7iKZQwNUASbU
         Q5kLc+Sw8TBcdUxe84IF0HnwlkW1Bri4JRTYv8fduYcWis5tQfNV/0T90NRMGYRC4br8
         k5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552901; x=1790157701;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7//tLcxJPqzMOHfjhQ7X/fv4TViekpIWdxqhuUu2YIM=;
        b=ex4D74tvXyDM19CDPqfUr5gWYhq6ETkwmu+z2PSQlHZMXc1TsECghKlYvF4Guu2Cny
         JRKZ4Iy9uQaDsQky9Zibu9PRsXQtzdFEIAxNaF1Vv39uM4d9n928GpbgseD5DOjq7dI7
         T6i0oIY9y9/mwBDLCgO7ONkeJFCFR+9Nqc3t/KVecE1EoyrADbWioW8N/PDMxfdQFfgK
         vR0FSGdaP76lIYQ8wA5oYnE54/DOgz4wc2058o5HOrQRyyuHSOp/UoXWL/RAMn4wMEmp
         fwy5oe0djZ1Z8Y/yQwV01yLRxJs8e2FUQYMa3IRyWHw2KTGuEy579zwJqrahp886xGag
         JwfA==
X-Forwarded-Encrypted: i=1; AKwUvBxDA8jL1Mbw1xWTy7ydHmkD3t5DWQ5JpHUXwJKlIs9n8uRskwnFpkb2JN/qILIFJu95qgvqUYJ9VEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+DBLZTYNNJhuSIgb2LIHbSgFg/zqwxOzjgmXTddVBYkZQ58gL
	sTi0vI4ciYjaCfC3tDB5PVUxbqTENlv6HqCCrVuYBCs0z1pFbIulxi7LgR/ZOmevp9KphZy3I3j
	7bJJ/AxR30WcG6TPPqGVE3ECV/rY/YqH4aXJ6EH63qTf+sLj3WMGS3Faj10YIHHI=
X-Gm-Gg: AYBFou0/geEMZkongjggYENd+xrORFuqinO1jWOSCC95hlyIAAghGoTpkafFmVnK/yG
	2ZMdraFYV5IsjdAr8KtmmWDeahQ5fUot4GqYyXZCToybd97u5ftIpbRZ0jtSc+qSlnWVb7j0Zaf
	vlHsDkGxe31QGjb/+aoM4RR/eJ3jbhcizyjJFIg/IjMpo4eoIzuqghNo9FuHo4Bc7I5sT/YKlWg
	0bGwLjB//3oGVbqJrxnCIwlrrDHw2bFeKVaajKpLThU3jbksCIzP2/R8lH7mHvGamLBF0HCywzU
	cWfijeYYiGgiOn5t0Y1UTA80RzbFIkDcy6v1L6zG3rJtUHQimmMH+qVxo4Yjr33Uy7onnriR+WS
	eCPxngr+L
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr153284137.8.1789552900939;
        Wed, 16 Sep 2026 03:01:40 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr153117137.8.1789552900350;
        Wed, 16 Sep 2026 03:01:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc3da0sm47619595e9.1.2026.09.16.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:01:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:01:36 +0300
Subject: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP9oqmoC/yWNywrCMBBFf6XM2oFmSCP1V8RFnU5ifCQ104pQ+
 u9G3d0Dl3NWUClRFA7NCkVeUWNOFcyuAb4MKQjGsTJQS67tjUO+3/DJ+YGBuQ51pkMf38jTooo
 hZcbsvcqMtCdnzWB7MhaqbypSj7/W8fRnXc5X4fkbgG37AEEaKCKNAAAA
X-Change-ID: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=je47a7jlI+rI7fvwiJQVwy1hQYEmz88kJyW5vpEN1rk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqmkBc29bWbeMaLLzvmUQvZvX+R+TQNXE/AofO
 ZWj43HEwwaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqppAQAKCRAbX0TJAJUV
 VsTcD/4gC9RoYkQnsB5Wslf8Gh+Pdnp6rRUlUthBWvvtn8gRpL2U1Du5NfQUryvP4XdgO6BHPnj
 vllwVAxM3c3XPmXwJVDQDwEHj/LWXqhACs/6Zwrc+rd9uWBY4RkP0das2qIJxvGMsUmEpOf/5d/
 z/9O7gcrYLFmVlEL1bvYZ/BBM1uoNKqhZ/8CQcS4A3tsGHXBAaR3WJtBCDTXfG2OjKGjdSJ/6qP
 aUlu1CHvucwRXf3Q6uYFIf6Omg8malhCW3S8qPzthWYSJcppfjfEvNF6C9/vz8Ert1YVGSAYIE7
 ljrlH8Tz0QYjdnKra+PNKPIgTANGUGkDIFEcdSRWxYX8c1LpY3tv4TnZ+EUusRz5VVEgfAPenuM
 hrcFkpbTH0IfdO9FT14vzp5EsIJmHjHzbPKvrjz5UoeD8n6qmtgcGNkTMO0LvkrVbcgP03Y3uV4
 r4hyH7eMcCKZQQ89RbXhroZ1b/94xrCbP4tEwwRRXplLc6XlxWIS4iQYf2U0QdPO9VcR2CO7RpY
 lY8bXDc18/6U+qlXRNtseoFhLeSAAVj3s6s6vAIbMjeU9SJnHIh8tfHCeC9QxOlZsEQKnnbjhnr
 uYj/c/nFMJBajJzV5xnf2r9n7v28IzaAdC1WJcfvbJWKNpl0ouFOqp0nxoyAuX8/MGREcnVb8Jr
 OJJh62UToivj/eg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: bprh_KMWjaeYjMFJuZ2OY1P020FfZ9u7
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6905 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uLPiVhPF6TeGUxki5eMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzMCBTYWx0ZWRfX5jAc8tyZdg9e
 F6xl+mGpvpXosV/Xjx8ARiKbM2wsaDq8rBmCZUh9OBARuHwSShzG+JBix60QwUPOTbjvF0x5KQD
 Rj/5jOe6JXXhvb1YjmqsbAzSNjX82W6kYAerfU6ud2t0vNYsppzDsYnQnKbTuE3k/TSlQR6i1hL
 V6WmgsLqTsBeU8hOZJsL9JKjNJ6GakfqvRtjAqxWljZBCU9q1kuOboZX57ul6jW0uYByEN8OOfW
 iI0elQKGOytJ6SzTy5nkxKCUejg2WZqfzaFBwwnbgsz3/Aq7X4GPBYqkaZmlEI9bk1tHNkpU9hJ
 vzfZ1d4mulYsSTyJQjdHrqai+yqJ8S2Ru2JxKXdISXZNZch5SonJjgdJtFllmmfgrAtmnIiOzIX
 2lVGPJo5L7DPNwBEvShlFtLPrP16O5VWl+hcTArOefp3BlXAQK2L+bnZTRMoA1yL4Xb7LG5zBzm
 DsY73xPrAgwP4kUDStg==
X-Proofpoint-ORIG-GUID: bprh_KMWjaeYjMFJuZ2OY1P020FfZ9u7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzMCBTYWx0ZWRfX/c438/WG6grd
 6TAEjVE4hpxDmCxABBAQD5JE8rqnq0eUH6QBtoifeJz3HBtoV6iKqB8DsGty8pwcAj140CiT3dm
 PCy/ktdCuQmiW0Hc1BEg9FbIFBV0Bdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160130

According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
Drop the extra zero, otherwise we land outside of regmap range.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..1a6a1e74e805 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
+	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


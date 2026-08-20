Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79F413785
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220555; cv=none; b=rLTd4YIoEJGktepR+7U0WQru/Ax4iioVqWvWlvT6KJcV6ef7xxasOsSagWDSUgyu1eYAHbory4PWqM+HHvX2MWQEdRoLCx7jhttkD4bcVEJ/ZW4BrFim6E8CJ+CO5nbq0xONkQRLDp3eCKO5OClxsFy/9kcJFwjhxgcyXaA1O7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220555; c=relaxed/simple;
	bh=8fjEokQWgCVswMg04BFi+Rn06J7O/YBo7nyvcTRzBCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehR9Lqa5zbbp6+Q+B5KqGTxNd5WkwnNCImpsdsQaLej/kaKNbM4zgVdnBDEV9Op/BFl7Pn51OzexTJnebbjokixDVLMlql4NOB+3Zlx/eGa5W8MwKqwBowzrgXKZpfqe/YK2hYhrJ3MvpRLMMCLMXjEsCwvBl8gPe/JRfYJvrN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM5BmlPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu20TXoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM5BmlPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu20TXoy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PGbF2465486
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYelyv8NhNc5RVp0ZRO3w0szD9gyMLi2vIY9TUhySMk=; b=hM5BmlPr8+EBsVwE
	joeKGDmzh5bqq9lyBHy2L8zv3TejG9gsAtrsE6cQQJej3XMU1h6zd3LWbZO0YfLi
	5QXNlcafJHN689EykP92y0nklJasfUGILHzCc1WA3cjtKpst8BQ2LzyRRanBX2in
	wlhMzjlaffq6XC5LfhfgLMxEByJZUhdqq+brYfDbpoZCOZqw6GLq5SCK4Lj0PFLu
	WBOyzliQbrXkE/9sCOdTVdDg3Gdtmys7DHn2zcIak3Z+WLrIuUuWtkuAUCoNe66M
	s6ydzYSBN0nardLmnUB+u80KLinks0ysjZQLj2lJ7MBAE/1Qm/5OYzYkK9jGX1K2
	5XepEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gdc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349c5af52bso346359085a.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220537; x=1787825337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYelyv8NhNc5RVp0ZRO3w0szD9gyMLi2vIY9TUhySMk=;
        b=Hu20TXoybekEluN8CiW7VC2qGx/AQ/hbib8vxq/QPdncT9yzq+NUDfv7pIOTSl37vv
         fRGQssBHPSRXwkxvDfuQdEG5J56J2ltwg/ehQsE/dfjVi2/dpmvQP3X4gf/ajTfN3wwU
         HAU4iHh0i33phIp7Xk7HicBovyO3jv9uPln+qTtA6CuyimUZN5DZp1bJ88tHveNfCLSb
         Zm7ADqNkgFIgNTHAeGVZ5iSNtYThFh3dnR8E7tD38YgcsyIjuoNZNsJmtKZMorj79Odz
         w8JtqhKB8I62PSPuZy76OQBaXW/erUTKGJc3YeUFq8qXdAmI38wt8EcA6wLGSDT20QNN
         HjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220537; x=1787825337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYelyv8NhNc5RVp0ZRO3w0szD9gyMLi2vIY9TUhySMk=;
        b=P0Ql3T4PfTuNknkOPVWVNq+zEkZWVRxWBVrx7xQtAOSrO9y4qsBaHD020Nwb7aMJoW
         FO28LHvRj5LmwS0b/vNVZQxOoo4OkNcrZAjSCl+/C1VRaseCMM1G8wj+TqJ4ksT8cpiA
         jCoaP07lgZt33usoF+6wCpCOfUjn0Cqo+P4uOF+ALOGv3AonZdLBkGkdl7Wyer6v3mIv
         FwGkHhr6ow1okdfBgxSik1q4GFTHH3hYdhwwss3P/Sz9c02r+OIBZT6i7luEXXtsNZL2
         Z4ZZcChn7NoL//A9fCQQPHwbGdSIKLhfqX4o4VcqFjpxu7RdKlD+C/1TTCDDbqkTymiK
         Z8+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpLFWfv1iw9NmDAMOBfmU/PsqhgXIXEjtDHJv5lJCL8VmQzq5W5Dln8X2QOA+1IEFrkRkwTNZ9oupk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4heTxIsTp5D1UI/J1j1+EzbqBhNpblsOvRUN/88UbRm4X1ZII
	z6Ug4WzsemUTglLbXzMf8KjU5KPCx+hr7fOxdk7V4X1vkKXabag2+BZEoipYbBYrOJkHvYsG/s0
	CgwYOe0f0G0+SzUGfes1jw6kBFd0iRbzA/F8a5qRi5j8CC+RpeOjj0Lyhn3D0pqWVeTL8yoE4Rj
	x4
X-Gm-Gg: AR+sD11FjW0Ebsmr5e7fwOYXu6RPwAZZyE5QuSmMagL3eIjgmqCH2GUq7X1PbuGs90q
	zPmNiGwtBthXkRZuU8FCDR+JtQGBAnKY+f3/2Afw1QSapelJiNGb55IRpf2EvcchBK9iADF1dSJ
	QCqXLEOm5aeJSFEZ1I/Oeic6ZnSjN5jP6Jv9hZDIyyaOcqD1JKnzHhgNVDr+6H/6wX7iFpw+l3D
	AEMsNAX6e676E4O+5eCKaa7IvH+1PvzK6XUF6ioxJV6DA7W/5xtUr0I+gfNbIxp13RxxDvn7FqK
	W6tWaoQQem6IKUjXAxaA9bs6upJFwtoKmKWfhDwDoNblMKjJ3iGtpburSIeCZw1a8ERCycHEOis
	h+ozIA31W
X-Received: by 2002:a05:620a:408c:b0:930:b5e8:a40e with SMTP id af79cd13be357-9371e2cbda0mr1042401185a.23.1787220537217;
        Thu, 20 Aug 2026 03:08:57 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:930:b5e8:a40e with SMTP id af79cd13be357-9371e2cbda0mr1042396985a.23.1787220536678;
        Thu, 20 Aug 2026 03:08:56 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:11 +0300
Subject: [PATCH v2 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8fjEokQWgCVswMg04BFi+Rn06J7O/YBo7nyvcTRzBCg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtH5liH+BwHRxg7Y6zgTvh82zhkEjcLL6anM9
 cNS38ULnfKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR+QAKCRAbX0TJAJUV
 VvcsD/wLaAi6hYCC6wrR7LVkwX4QPnvYtC3KrBP9bDVlne4oy18WEjnHsroJwduT14BkkGQnSsu
 5D01+4ynWa42iw/m9Sf6L6l5mSoala/2tRxJZYvfpNFIiJTjZlf9NMZBKy9k9H5Yza7bz95RHoL
 BI3FPy7bv4CXdpIng1LYG5AjObS0gVfnM/KSHKuyuGcpIHYYDj3abz9pAQuS6JHHSpIvH3DoCyb
 d01ikJ+ld6ZD4ZBNS9quKqENncM3VCevdIrmK4YONrReNA6cs3MWBPAVR+JfSuI4RpuPUrag9ay
 yFMy1ospzA+KdYqN/mPAxIms8jqZW4ZTpueR4wncgnmfOCVUevqIfcyKWxThcEQ8+djSZ/FrMcm
 wyh4iRjZCXIKIMtQ+D5tzmQX3HJy994XfrbarjAf+5oXiBARtvi6i64x1cte6ygs0Bn93umzOSC
 U3xdZ7TqG8DtvsGNK6p/c6Q+KrwUYzE2zpohjohthOScjWqvQQJ6lw7BBpJre1D2yM135RK9ve8
 SWrlSQWIzmxl1B9ByY+d+cB4cbUxmR4qBDqLOjfc1rprQQZZDrSqueH+nIAbk1qPQEY1JQ4h999
 AHHZV3Lrr9bnQCpfVMjhafI1jfb9BHjcgtsg497Q8uNwbbHqHdLK55lu8u2oV3HVw16GEPt39Ky
 Y3KPoNSPjvOikEA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: GEE-PenK8X0tLHhyXQkf7nJpdx9pn6RR
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d23a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX7i8BR/XthaOO
 x1N2mIhEmujh+ZqyrdfmcffELBMWx7uW042jG8VYuySNDvaEtRXBOmAigj8vx2YDHIdtcMmP+P7
 jjCuVa18i+wZnaDu3QhC7KsxUEI98dDADtkQldaxDwVNAYXlPCtaFhsg3PX8TKqzKIdU1LquTCB
 mBiOivOT8LKYktS0UEu+/ZDwCTYeBU7boh5Poe7bf+ijUefzFkfW2w4lbW6SKjyDcIIuuzL+Qdt
 Lf8dxPxE8Z1sjQp711LaD/bx4EkKciaEnBSrlU0b1bWrWrYOauSQvGcvWpMT+ZWWdYrSZqT+mzZ
 nkp3sjzhSHTNnR9CSabtegwZaNGzI4qGevSZd8adovnPI1jtm3fh9gSFGNGpRxOxv0n4UKYqJOJ
 H7VWY23qdjEt0d3hFC+D82ZjufuIchiBJ70BN69ig93EMtRbMjrOAuZIkKmKcWD8w/dNNwg6Lhh
 S91FM3yIAA9oNGRiK+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX3+Ee94gLEA/Y
 9r52GVVu76q9vsNxZrhY7lXu5yjAjYgEldl3YYLnuKgVl7rYMgNG9uLDvSdR6x2K9bEs+NRxPU7
 z2cYvBbIPogAo5MlQyPxLy6Ij4ohL0E=
X-Proofpoint-GUID: GEE-PenK8X0tLHhyXQkf7nJpdx9pn6RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..601c81c84450 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.resets = gcc_qcs615_resets,
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
 };
 

-- 
2.54.0


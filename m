Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED9E47ACE9
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390160; cv=none; b=B7rhSEzB30lCmy4gcES37BtColRKBdrVUEc96VzpuP6yqCKKPxg26BBkZ3rNr3GgNqS4b0+52UztvTHDLC4WehhvojiCTfqzEszA8xxCYQ5Fg5r1wCm1JmU0apImr6v510onvwLqlmNRZKunnn8muE9y1o4/uBtv2LOPbxLkiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390160; c=relaxed/simple;
	bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnKO5XIYbSk76SUY7EE5035bJLPqHOAmMm9qVeQawihx1dYrqKTkiT6NvF6gPUUhfDWRXcohEXRhWSBMgcJEui3OAK7XSWdjB3E5ir46QQKDMYr6dYNDl9HaUn4c/tCa8S5jHe3u8n8AfICBZxjcJiEMdcTHvLIhyiPoicfNKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMWn31hC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQY738eI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMWn31hC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQY738eI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2Yt901934
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=; b=fMWn31hCpSUnsH5i
	bxHwCz+YV6bscRjrv2nvP44q1AQtrPgTJP3QW4Y1zsx/DCX7YgFzBlAbZk78j2mC
	2tfWYWpxgUxBEMatzm6Dsbgx3NR1VYMWEC/5UcUDMHIiFsj5YF0MCEQWZWNLqYPN
	RdLsUQh25ZWpZLzc8bxgs3lZ43m9muWLjewiEGs1E9ZR730qFpV7/am/lb5SDFEY
	TEIs3GoasnQvHbd0M5q6NZrHtfeQDlxBcq/Uj/hwd76KLVpDRYVKhtAemrF6ACEB
	2HSNVnRVYk0gDAACs/n6UIivSgIn+xqsOA/y8ZihjZOYxF1uVEFIOL6BXo35D6VR
	R+CfOQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrwby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-982fcdd9b01so41958241.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390157; x=1789994957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=aQY738eIE0WCbtArsyfOi7moCEOE6VZSdfbMwJm4Fb7lV9ihOSRpANLWMto9k5AX8P
         hOVyDJchdu8ltI+hMUx2mesd/5VmPpkY8tZNV6mnMq6fpMd3pOxP/xy+POCrT2meGmkk
         GqQiPqb5hC6MA6kfWBdyVZ817Hu3K4rxpjHfsuITt2Uw5ojJ+nyzv9LF+WGXM0FU5C0n
         loOSt5qKV2uA0e0byzP4a1vdIohOIVdWzbwk2wEimiVVbmQcCNcBg39zPDHGvkPh329C
         /sp+sQ6VLlhyczWdww1aZerKFlSSaeQCLdMilR3hHFxHTwBGfBwSJlZ1cl60vXLKXsDH
         4ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390157; x=1789994957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=F9PfE05W51nf3in4K7Kv2rzGraTAWUhjGjY8AdzQLFch2x0g+wfoN1Sj1Re4uKbFk0
         wLlmNy8Q99D4LUMbB2O23wf+Qdi+cFAoFbdnZ1qgytET6g6xsXnxxg/z90wdVydfgGG4
         4BlLL9AZNnXK6fLX0ikFCwv5TltbUHrZzeQqIefCN1HB2ZwgPu0C06nZ2DZgyfe+PoGl
         t8U/1ar5JOIDEoswMFSu40VrtnF/K6sqoOfiHQ+GExQDCAEPof9J3ydfiBzOs/xCy/dz
         t9dDWv/Otr0t5Qg6dhlurky70dZkVy9f/9GjicAYoesybGVDWJHdi7Y4tRHXoZMO5QKF
         0NsA==
X-Forwarded-Encrypted: i=1; AKwUvByy892NgKtO4S6FyVYW9ivnqd4j4cwGTX/0Bn7WMdeppnksmhIZIX+3VK12h9TDOvd3knNJZd/tt0k=@vger.kernel.org
X-Gm-Message-State: AFuF++kIw49CfzgYII+u+edraff6XsOULoX/tG+Gps6wZmJwniw5yMxZ
	iXkNVf3A9/e490s1+k1h/wi4Uol7Kch8finT2hRDJ4ce35GCm1y8Pdzn+mxlj4qK6BguNTP14uf
	EMaa7IF1PGsA9qNCgTqMZ2WSuzDGzc7VPjvXgkyIfUXxA0+EIkNSBuL8sdyfa6Yc=
X-Gm-Gg: AYBFou2nYWdAzcL+Kce+ZYTS+cjJoaoZN1JtcSTrgpkwKlGsloWO38SXkaOusvRNlda
	6nqaHB1XA7I7vlssscb5nyQs8l9X3m8w8Isw6jz6EKAGhGhb6KOZ/0uSRGWBjwNaGiSlTz63a0e
	3+Pk3mzDacmA6CtKFFyK+1r46ajuqLPUxUBnaPNveUFN6HtYWyst5/Aqx9k/O7kQBUMkGBSPHp6
	y6AUj9vEJT8baXAfEWhoYocquSo4B9PJJek/jTNIJjaPLrX7ixdKA4H/uUZFRk2swi+r+Z0GhZY
	6+/9/kEBTqminDCRSipf3k+Yzsd5CbMI22jLG34lzc31y+qJ8WYzxS9SeINos3mPUDv4EE54S/r
	C8AZ+plus
X-Received: by 2002:a05:6102:dc6:b0:779:5049:87b2 with SMTP id ada2fe7eead31-79b517aca36mr1218359137.0.1789390157099;
        Mon, 14 Sep 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:779:5049:87b2 with SMTP id ada2fe7eead31-79b517aca36mr1218322137.0.1789390156642;
        Mon, 14 Sep 2026 05:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:27 +0300
Subject: [PATCH v4 28/52] clk: qcom: gcc-sm6350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-28-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zmdoOi51O8okuIYyqfMOQiCfHiJU6iU1Ivi
 dwCG78PAuaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5gAKCRAbX0TJAJUV
 Vh8RD/kBIhVFpnHiU6Tfj5QoN0vxuI6QouwqxL8huQOYIJbNIOYWNLTiAq6gV549erFRGOK+6od
 xMVBzlBiuTM4qA0wXyMjazIHUIn+dJ+F2DWva8AfKaivPiiVEWv2xeM9zVI2HAjEa4rpB7ygruo
 21X/qT+UOpKekbwnZdF4RQOVsF16C9cVaYQH9txZkeu+dD8svW5nUNqZf932pdFs9PzRQf34Txa
 eoaGWvvvbxLJt/OnKQyH/r0EBAwWf6vwnQ+od/eyC5GWw/mKo6GRY9LdtOleERMuCu9twQ5mIKs
 q9w8REMEmesF7RFutCAofhLjzTpCGWihSEcvu1+ALX0jweA8LEe84t8jG4GHJBAJztHd3T6Mwgr
 rGQWAEfirFgBMB/9wRq3vup5JuqRfaFbQTVYQdTa2/fYcdtDCPTRANqaU6klGWPwpGHDuzMM+AC
 +Zmhit+HDf7C087DMN0fyqdJBOGKPG2Pg3DPAyZXioykKPkGW3/lJHc8YRLIjBCRpjw704sl7X0
 kGug1UdGDg0rZBnhg8SlMM66OgqgElYyC0bhcBRkERkad71WE2UpNngYEHU+h7R1U34cmCfYE9i
 iH255WG22QgCvtdeJQcQ3n1n6k2qBsJKZ7/hKoAVlthlKzBsi+4/LNvNw+gtrQ1vUoxygEyguJj
 FTJx7INlMmAVAeg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: l5qvFzC0O0-fIEu9GQrJ4JITYwNgr1TX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+t5iSOsmQhbS
 vkOQ80jki7ylCIlP/KL0i7rpOC6092keSDzkmVFNwHS0YjEW2jzKtKW/spNEv+TBVnYb/LwB+uN
 SD/uPOrYi3kdx8h0rROrPtVxWa26RRc=
X-Proofpoint-GUID: l5qvFzC0O0-fIEu9GQrJ4JITYwNgr1TX
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7ed4d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/HIXpM6cGeag
 1Il770IMLXXlpIR+Lg5KEaVWmWf6CcMwVvFKDkGERPMsQAwwfJNIbxl0lXbf3Ub32YPYyzJm1Yr
 l6D7xSrSr7Huc0LrZuKFL/SRMiDiUpDGAQqlyxyVHh0gq4qIVMCo+ThmX+/wOty2NSLodo6asK4
 oclEX3pqxegPg2QBg8aK38TuH96yxeRYXcisRSYWAR8Kxo33dTCGhiFWMQCRJ6ctE3QT7ZrgMkk
 B+IfPGh5kppHYThCTrybk+uNwQees7VsoDp5uLpE/dzZKUg5TYxTq7hJ4bEZgM3nuEJ5204fIUz
 /wW/xmyMoFo0cWyP1hmP5Fqe8N8A2hffkt5DSbe6Y7UzF7Y96lOYQi4ti3VWznzEzSUSZBw+cZE
 uyL/KHkQRCvQm1qNEc5QaakfYZI7iqtD09LX5fZFNYRNMIK0TIbBc9Aj4vSGm/qYUqOnVlAcFl7
 hBxPOGnaDb6PPg/JePA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a4d6dff9d0f7..b99a5bc53048 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2545,6 +2545,7 @@ static const struct qcom_cc_desc gcc_sm6350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
 	.gdscs = gcc_sm6350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm6350_match_table[] = {

-- 
2.54.0


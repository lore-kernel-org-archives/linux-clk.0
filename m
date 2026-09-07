Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ECD440A1F
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770251; cv=none; b=MXdnceP03f1ai9Zz73IzYaL7eO0eJy8wglsiU7L8q4BYISfzjCh3p9iMux6EoBjMWXLSTn9fKUX95gTxEX+qNKN+CbNBHhN466G4lmCbVNhaEsua0Q+el719bdzu9zLYPCDxtAz7NiCXWNVILf8PqtCCGu1ORucOhVcvbo8fB9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770251; c=relaxed/simple;
	bh=qnytY6z2HDy95k2PwTmM5yjp5P2y6T3afodhcc7jnY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QSnt3U7BTeml++HWI/vJZekIovamHDqzwrb8HmxIjLbvjn06mLFiAhT1ndJNzx7I4Xku4g9dwfUXIYC65UiN7+LWqpg5i27HO/xHWkm6+PXn+fr818dmbGKsr7UGNwQ9O2FDYFf5xJzKetOxqvAhyqiwLj1w+bawRfdz59lVIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXElBDHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcN/m2yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXElBDHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcN/m2yH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878Rl7N3872917
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 08:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hp43nu0lcflbC1poEHaJtM
	iG/tIWITlAFlzgkXo77Ak=; b=kXElBDHrPGDNzQd+sohq6kPXA2jILHe7tUDODN
	yaTK92YheKS3jJrqqM3ZBSB3t1AWdObO/J2tYMp+gV5Ah1AaB7aq81gtQtIDWzEb
	FIajPkmEZpy8zWTojL7OrZ93Rrj9NTqeFxpfP9VHS+F93YELFnZ/YXjEFj0RkrwP
	auHOP3rdDbxf+JKuzXmGbPSHump5WaGEmKDr+CAjPSizWyNNgy8RV+7cmezkvHMJ
	4GFmHRNUisUP8bQ464HGXWlQilYH2picoBzfGtrPo/toCszGMPKPIZfBtIz12UaT
	Fk+k4+/SB8TfFXL7r7iJtGJES8Hs56v1OfFWoxNzh8ZHQwKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg01k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 08:37:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5373305a12.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 01:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770248; x=1789375048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hp43nu0lcflbC1poEHaJtMiG/tIWITlAFlzgkXo77Ak=;
        b=AcN/m2yHFFF33nC0zzEZCgkse2jgUgaMIAyQnS8dhSyvYBPPx3ficgB9Nurg/UPmiS
         UNmw7LjKHKhJxzvGC6RkfYoVfQ2P2/1HISo7pmN+RGu1UAqYTH0MTOHqP2GINiVw1jqZ
         VeAr+7jVRqiFXNb+6BSbqWGogUyxZ9zesrQvxfLDRXyJhYzqZ/5RgW1i4syzSSSxFkyw
         xDRPrOdtuE1qRCCNskoK4lifXzcRW+F15gALkYEPF/xgM0mBTGNh5ATGP0bpiWhtGoPY
         pDCSE+6B0TfXLloTCu8MbGyXpkN9KrmUHW9ULGTMOzsYnJScQZBwcGFh8m5dELgIOW/B
         sq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770248; x=1789375048;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hp43nu0lcflbC1poEHaJtMiG/tIWITlAFlzgkXo77Ak=;
        b=jNV2Nd4qkIJMITUzCHTl3ZUnhL5U+B+/hOeeXKe278vrG2aWpw79vCEqQb7GU+DkBx
         vywPaqhyUITSTPY5Sd2B9dGofauLkw9K43PI2/9RkQoPnTEBGnI5gZo0ZBT3XNgDWyie
         Ny3RCj6SlU0X2KmYBcbvoaExZGIBLYZP051s3TOs/WW+dFJFaP/yrIKPY2BvKXeMTV0u
         RGBLZ92Q6L/m1WW5DDXypEIn8kEjhbp2asCQrlDEVizKxFKNHGbCGEJCBbjudCcSriwr
         CMP8VdvYZdISVUuMt7pbjWb9ug8JjX9+4UQ6HSAPd1WoExfnDj+KTXySUI8k5aKteJ9a
         Yn7w==
X-Forwarded-Encrypted: i=1; AKwUvBwyg8fYZcl82+fLrYnhE2P5Vb8NyzhBJDqp47OVleSnwo1nE9YLmL/U25/iuRmO/3LVwo0qP6Dq/cA=@vger.kernel.org
X-Gm-Message-State: AFuF++klSmbeSoQVm3GI6ByQgqOBsetGuUub4vo5t681JoDqoIuncSVA
	PzXW5/cSZS6zZzslROBtJxq7Qtc67RGMQaiKt7gRbvGabYOr1TkNSOyvYFVSqF9Rv8a4ji3VsJi
	48yJ9rKS5xr6ioE8e9Vtnm4Np22lRPvHDV3gG1gH4WQW6tYQlX/fHjb7A7BTmRwc=
X-Gm-Gg: AYBFou1enxGd1DdksoyMrgrxnAyj8j3gtmmzTS+jJfmSu/YFUkwgUIMW57ofuyNi26n
	sbSTh21u7rKgM3wOH5HYXtO+rzklGlnQsymAUk5F1v0CdMTFhJJRFnrCNc7BbXtrJRncewVig2O
	VJT3rl8QjhMKpuszmRB+abvZinonsSK3xUr0cJdfFaOSyI6Ns6vb9W4wNs5aowCdxcpXPPh6fAV
	d9kRoJb2pAcPmcKfgj7PYqkr+XYdzjgj885UB4PbYi3YY18ghVf/5Zw7MadEOHTa9zzoxHuGpqg
	1KfX0f0YBWezPDRL3ojZiT59JgXO7kHYlgl8XNMBdL6yfpGNXFHe1ZmELbSZRmca3CRsUs5krEJ
	XJN/BC7Mw6vi6Z3th3xdN/jvr
X-Received: by 2002:a05:6372:a711:b0:3da:5f91:4b37 with SMTP id adf61e73a8af0-3da5f914d66mr15341883637.23.1788770247604;
        Mon, 07 Sep 2026 01:37:27 -0700 (PDT)
X-Received: by 2002:a05:6372:a711:b0:3da:5f91:4b37 with SMTP id adf61e73a8af0-3da5f914d66mr15341846637.23.1788770247137;
        Mon, 07 Sep 2026 01:37:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm19057078eec.23.2026.09.07.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:37:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 14:07:18 +0530
Subject: [PATCH v5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL13nmoC/3XN3WrDMAwF4Fcpvp6L/Benvdp7jFIcW1nFkniL2
 7BR8u5TC2O9cG8ERxx9uoqCM2ER+81VzLhQoTxxcC8bEU9hekdJibPQoBtolJdjoIGONNGZwnC
 MQ44fMnrUnXUGUguCLz9n7On7rr4dOJ+onPP8c3+yqNv2z2ur3qIkyNRgQjBOK2Vecynbr0sYY
 h7HLQ9xYxf9T3ll6pRmyu+cbXvoOtf2TyjzQGlbpwxT1nXOc0PFnXpC2QfKQJ2yTGFyOiTUje2
 hQq3r+gsNCf9fngEAAA==
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX+1YeuD1S+SHS
 DNYknT75CWiLPLTsI7ZOUv/hxyN6VMTMfOmUdUmKNAnP7T6EtCK1MZI91ag2BhanwO1GERlLGa3
 8iOJK2mNAAO8LyLRQo/UOiAwATcFwYIPLx3NU5Al4yDfPME529fnC/qwphQ69wdthu2YhJkDw6O
 krMk5LaUEyT6iXbkAh7CyEa8pHkGF23jeKDhkY2ahWfnJj2LQdA39gNdYJOviJagca5z/vFbxcD
 ZwCKK352VeHOSxJngifZAxYXA5tc9JOqpz3uYSRfN4QPNTItK/P+mk18M9PuqIEcwTyj1fcVFPg
 fNESPWH8dJv+4Fd0p7bUc93NrCayJD/YDJFh6osmc2laeeD3PD+cb5m2PqmrLVXwhKrChBkRhnD
 XWQsSr/xcjG6ZQColYPKLybbk1r/GkIF5zE+yHLncFTN7pk0fDc6a5T45NWyTi3jrhqy/L/YMK6
 qNkTKjwIz9Y0rYL7QSw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e77c8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ejcyFZ-kiPiluOC7xQcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: rm3ATIilLMSi0_g_UdpkYI15vVaovbNf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX03XDGPvGu8cO
 QanfD+dKdYk7DaT5ie1yMugS+cQ7YjNguXrD9h5scgdeutVdJQINRBsF+90A1eW1if/fWFzmy1p
 npC+OkBT6E9JQc1XQduM0C7/7e7fOBA=
X-Proofpoint-GUID: rm3ATIilLMSi0_g_UdpkYI15vVaovbNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v5:
- The RPMH, TCSR and GCC bindings and the Hawi GCC driver extension
  were picked up from v4 and merged; only the CPUCP mailbox controller
  binding remains in this revision.
- No functional changes to the remaining CPUCP mailbox binding.
- Link to v4: https://lore.kernel.org/r/20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com

clk: qcom: Introduce initial clock controllers for Maili SoC

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

Changes in v4:
  - Rebase the binding of tcsr to linux-next.
  - Add RB-by from Konrad Dybcio on the GCC driver patch.
  - Link to v3: https://lore.kernel.org/r/20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com

Changes in v3:
  - Update the comment for extending the array appropriately size.
  - Add RB-by [Krzysztof] from v2
  - Link to v2: https://lore.kernel.org/r/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com

Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


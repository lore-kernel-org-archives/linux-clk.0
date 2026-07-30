Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EE3B0581
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434087; cv=none; b=lSKjKjb3+LwRu5pPvVa6LFwucdJCrjaIodADmszXgB5pLJ2OnJ6emTsoVfKDZXeZ657nGFb4zQsPKRg18Iggmk64MYA2na+mycIEOS/lkNzJVqjkL75uTPB8Wg3PYcI0XsPoe6gYn0llXcgVE0We2OuIgbB+R6r4hhHk2pvctlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434087; c=relaxed/simple;
	bh=/QTaqqQP/iMHUTIsjATiz1okadrXGJ+qYuzqDe4y2uQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OR6/XGJyxa6K5NogVoKRk95Y839cEQwskVw94OOhuhQD3u1JqDuxHwFYctkr5o5gizh8+ZGbTeredF9L9BGw1kWOf+2ZYHQbabYhIh5mviGzazRONa0cAZurp67d+krn3pl24PJ2kxyjIcrG3K7/akfjHerxQKwHhCdCYwDlTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5RpLKhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOQGcbgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5RpLKhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOQGcbgn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UHfF5q1458265
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sOYSAr6uu/0ra4AmicnafZ
	NxmpLHsj2Ia5yTMbKfemI=; b=L5RpLKhyEoLXRemIGOOWUQghmr9O1XNGFF9GXQ
	WmsLN2x0f0DUfkKR4OrBYkiDCzOH1FXuPSv5tI+Mi7Do5uJLb83TL72nvVqe+eWE
	HUUXLVbfLktcELUgVjM3I8ArTCTDsPLpwHuurnIBOtjQ84GEEhYhKAkXNCZaosi2
	uO0DiLp3nq5qW0U96W4mIyLbdQSeM3nX1+C9NHYCBz3BgdaXPBnvQ2ec9XyI9w19
	B3mNEXnWX0nQmDLUFp/C48JCaZJi/LPbhcVHJPBUPQM/xuzgSI4g+t2muTimJm1R
	N8Nxi3tmI4u4NLodwLitoWJU2f0iocmZUicor7L2ghJdqxow==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frb7wg20m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:54:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso123638a12.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434085; x=1786038885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOYSAr6uu/0ra4AmicnafZNxmpLHsj2Ia5yTMbKfemI=;
        b=GOQGcbgnnsc/WZHhGpOMWW3lvv8s8PU4ix2REwK7eA8rfPrG4fpTxJgiar7gwnMjfu
         upK8cqxnivNqaiPopOE8OkaVgrRCG0nTpXTL3mH06wpizu2MZ24Ost/QVTedflm6GQLT
         ki9Gq/gi8m7Fp5sw8nd3PdObsXfnJ5gfzOYh6sB0H5wpMjKDFDOZKpzNu2fCapN2yGGa
         8+9/s4Ecsp/ftk7V/99ITD3q3es1nY9aQ97elu0j+wHFw4egYBvg2TUaAlgK6wKVGb8T
         7XLr6etp9LboZCTiP/pNzPAjwyfKScbnvN/OEvWjMMhH30Ouj5tLlS9Pyw15zSMfUM5h
         6AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434085; x=1786038885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sOYSAr6uu/0ra4AmicnafZNxmpLHsj2Ia5yTMbKfemI=;
        b=jfuMU1Ji/KGZ51cSWSIfhHWGZ9+HI8vQk+C6JrbVx4eYkdazC+xoWy/EfLpXpWVK0S
         UWf0j9cMJhhqCBGuDAPFkN5i9rMlDPMG+JTZt2pMP5Hk+DMEjoD8gpXSq/HGVqBnOqp0
         sTbDssFR8GmVSodeaDnyM8PZlk4Iz5zpgfmV9MpMKFaAaPvlehQeFuwiwyg60T8DjR3U
         HhmK0todNkxCtjDbhmHW3jbVvrrN8QMCKQMtZUJJa7dUIOG52lOIheuP5ov/XV4YrfDE
         kTbOEFlTjCMaeAGOQ1+j5udrT9r2MUzsX2JDojB9R2bJ2topvwNyQv6eUxq8TTrfmx84
         odBw==
X-Forwarded-Encrypted: i=1; AHgh+RpUuFFmOD4v5q/jU6SC3VhcTp6nHlSse1XVfdDKBbC/hq04AEogg6wyvrwCLrAX/9aqI0krdo2hJ9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOxVtndlEijLwO6gIuOLvkRgzGB4MSbe+aZm2QPxFvsxKZKHX
	IzfhvmOPcxcBL81m/1PWA5+zKgy7/YQRmL+zAaKScIDhpayMnhlNFtKGxZsbixEQJE8Ee5LUXMT
	zvz7FbLtMuZ69kaxcnvCaSQMVkU8X/EwRitEL4Ix3HjW1WVnIUNSCIbPQM4Q6anE=
X-Gm-Gg: AR+sD12YQ4qtGzpOMoCKTAzxME5HKLUDn2mP5DdFQBnpSiNGXaehlkaqOLG6I0jyN0H
	IEH7rhaAifwv+/tQ2M3e3za+T3CRb9Lr+ziVJGzhC2uaDV8pHIZ1Pt8jw5ByIHUDfuXf9jE7Nq4
	bK2Lu5GLkZvFk7a0oKjddA7f/mCziV9bw8tddE+PF28PqXlbFKMxaiVvyWnqdBpvmoloCJZsijy
	4MfLxKOmWKYOU3oxl+JtzEqz2sVnjR/cLF4Q7mvLLMswqOMgtF6Pbq90U/2jCFhKqnCX/9PBqlD
	iGg5FehCKB9bKPdZoxpDr/V6crLi3jvimSaaG31Kj7uLqLYgvvcjWICeDCx0eZGCKZHQSBZaFAN
	D2amQoB/fCZXX1yJ4N3sOarM6
X-Received: by 2002:a05:6a21:695:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3c900535ef9mr3433706637.28.1785434084628;
        Thu, 30 Jul 2026 10:54:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:695:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3c900535ef9mr3433683637.28.1785434084250;
        Thu, 30 Jul 2026 10:54:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Thu, 30 Jul 2026 23:24:33 +0530
Message-Id: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANmPa2oC/3XNTQ6CMBAF4KuYri3pLwVX3sMYQkuRiYUqRaIh3
 N1CYnSBm0ne5M03Ewq2BxvQYTeh3o4QwHcxiP0OmabsLhZDFTNihKUkpQq3JTgooIMBSlcY580
 VG2WZFpKTKiMoXt56W8NzVU/nmBsIg+9f65ORLtuPl216I8UEV6mtLOGSUcqPPoTk/iid8W2bx
 IEWdmRfSlG+TbFIqVyKrCZay6z+Q/EfioltikdKSC1VbFCT0w1qnuc3oPmcrlMBAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: gaB1VvIwfz4XCqe6lFKd4xIf73ox1mEY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX/9WAwMavpyre
 UY84v0wZDFVWbdXz21k/OFDlFa7Bu37jalBNuHoDtHAvmQi/SQXsX2C0sXSDw63DEPomslwW94q
 McTIcvltHJlZYoFw4EkwcwoseBvDgbw=
X-Proofpoint-ORIG-GUID: gaB1VvIwfz4XCqe6lFKd4xIf73ox1mEY
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=6a6b8fe5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX0JlUVZipFo1q
 WpJKGZneZFfIc5y14oz5t+jCQ6Y4qfxUFQfjXeOHou9DekU48P/7wPirioCPz/IA4bWueCRBGR7
 3WYycKfgmbPWrjs/lQZ2KGaCsjSLLseGrbucGxatJGigfLQE6d740n6kTEk7385UwBGB1vucSTn
 OGP4HLsEuJmHi8i6UooCScLmMxsK+fvMR2+qYnGVPbgc36eH023ufcEWbvCaRCM6MJmVAOc0bw6
 ICCRHhj8TaV7AC6d01+DZO/9JX3fCifvT6g4pWaYOsU3b7PrQE4/4rGiNkLIbIAD5eAutHvmGwQ
 p6QzfHyiiHoFv8SK6gB/z9SIG+LqIpy94XxS7I7KvN4lHe2Rcw/UvBpdCERJEil3+T+H4phQKIy
 O9IHZGcTdps0kClMRgb8y7ICAYFyy236vE+oovpHXZXmmPcSDN7y59xOuOvYJZ6MlHe3U6PHvBe
 rvdPIkFC6iwrxlVg7tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

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
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  32 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 285 insertions(+), 46 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


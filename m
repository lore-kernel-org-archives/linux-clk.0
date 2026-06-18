Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A616234A3DB
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803315; cv=none; b=dQJidJtmbPJyhxXTDNk8pYvqC8bCtI6rolpsvHmPZ12e/dhcJKewdsJB3wg15Dzp2VyePw2ZInIuAPiYuO9TCk1RSdH8XA8JXg0D/J+tX7RsYMgfhFDDzHMKwnNIc/2nTMtrA9AtlvhkSjprI5KMBj2wqo84E2qWzmYzFoUJQfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803315; c=relaxed/simple;
	bh=Qcn9omGlfSZM1RD4mLtu5/9tTLSglTD/Uo++QbqEPG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APHc5Ab41pGnNC7DQuSNturMVIzNhFzbDbWeX5resnxC3TkZB9lemJlYYU1/YAZKaDMAgOTvbJiuDPoCkGE1le5jnSYg06Yn1sgFuM5KnL/QuCGa/JoG/9paZdk7gS3HyUJG8vQ4w0++S/2Fb3Sk4UBnKCgf1L/63J2Xs7uRRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaI1f9GL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qbs8w8iV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaI1f9GL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qbs8w8iV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IH9M1S2440121
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=; b=FaI1f9GLEbHxsJQr
	e2EVwGZO/eBh7Ugc8tmgJDpcdjuERW4Cef5SbPk4YqaZfCs3tSmkTvyNUw4arhzm
	yIyAkQBNbcBz9I9yc2Fg/PFqOLphSmt087jX9W+DsL8Mk7aW16Hhy6sFe6jpsa9S
	jYtxMwR0sGdErPC0u/Lue1Hwn8qJ7h+6DeTyYu99Ke9ciLoY6VsFwQmGILDMHX8i
	nZrarzMEanlX5FI06+PVc+SN487MpmPt1qC4PLcZTRAaedquIm4ZHL98ojoxGQRN
	hKFTVc+4I5pQXgvIBG+9k4oHPN33i7AYupJa30symh90w4GsFEyUfsKUGCuuPUph
	xlcDTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm228avb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so1348057a91.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803313; x=1782408113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=;
        b=Qbs8w8iVlmBLEkjMCtvixhvGMAk8RN76nu3iq8Qn1vbl614BfHo+N9t0U9dpSKDmw4
         ePaX2vVoLBMrCuF/IXw8uv6ezKlqOAk70tsWGL7FbNgMbbwKMT0wyxBBkqTPo6eaq3eC
         xxpFeaEaIEzVOpHV0wpbMpJDiGGrh+5QEJ79Lg/4flvAwkQxtnnt0QVPM1wG/J7+yMOP
         D8JA0aeyonH1QHFPo+bCyo82g5r4X/jY5iBchBzFPFfNbuYBr8YF4jtZFh2trqe1sdnn
         nICi7xdRtCkd6RJ2bz3f6R2E3K4RVSc22TOIRwWU2aPeFl8sTq0F/HXu38KcIWxS4C5P
         1/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803313; x=1782408113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=;
        b=j8G96z1DQ4l7WjreX5rjUaAqLEJDgX6Lv/0bby4rV9C9lgPOR4B1moB3rfjLYgJh4E
         i03p1KLHrJ2D4tUEJq+VVOQLRy9pK6+UwI1mmTuYKSKfFX75Q0YqTAlpwAFiiekFRc4Z
         IspEp6x1b8qOSQIDDWSGD3st022HL3HR8f7yJAdLXl+q3LEKEMvdBLenRrc7R5hk5xQQ
         Y+JBCnEd3GUkuZg2aDdxXFtGglrStIQHAnxsjz/h2oaTSduVmWYsVTQnqZP6HOksrLS+
         JrJxIR85HWTwT1C4XoTiKzWy3AR/D1B1klBI+bjzD1OeI+r21hDlryKMyKmkt03WL2Zp
         Xk0g==
X-Forwarded-Encrypted: i=1; AFNElJ/YnjwA2SOfhXvMdjNkx9NY51UymqMB4L4C7cHNTtZv3EiYaUnfhaCsw6STAuHpEgZwXe71MfhRaIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKjjX5E1lwwl3Bl+xNabVLvJtX68H41Dn0beJeHYndXBp2XrL
	IXEoEIxD+ElfmhycSAQhtOa954cKgdAAxO4gU0ao+1n0leddg1oWkUyiy3VseuZI2eW9iAU0uke
	Y9JsvePQJgTQcBzgvi539AsEvpmwL3ECo/w76O/MARn3fZ3+TRg7VfU36alHwUOA=
X-Gm-Gg: AfdE7cnqB7xckcjw1MUrgRUK29DJKAZF5gbZ75nPbjDHKc0hJCpfvK3hbapXu17PvNm
	4bhskY01PpEsPzwDXqmGbpzth9+RR6zuVGDAQeFbyuGdeT7AYUgqttwTOzJDtcQVbzNbw8EonIE
	YOv7i4md90CSOrv/wLgomZZxqPMfB0OLQQrDzbF+IfXxwjGKuPWapO3+r3yvXiMdelw46q5Wg00
	6AXqxjno0CSK3gHYkdr8Xfezmm2Hsr7gu3L5OGk+hElN8WU+XJWDzL1sIhsk7Fq2KrvVEbiPLt6
	ucBCI5I2v8nUCr3Kq/GGKWbAhVSfj1bBwS37mT0lHVNE2E06ZEEayWpnOjwi9crQNadPDuh4sTJ
	+p6V+kE4xfxUbWauc1sZT2DCZBSaw4riSabc=
X-Received: by 2002:a17:90b:3c85:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37d15e63243mr359556a91.14.1781803312743;
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37d15e63243mr359520a91.14.1781803312329;
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:20 +0530
Subject: [PATCH 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a342931 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: BHP0Ul5uLNaUa7TOgae-ww7eKcIdYz9T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX31jv3FXOoOvx
 7eyDv+QPukmISHIW+rei9ZLVFKgazCJaDo8zbcB3vd7I1oEpkpIhLkalgUmOVu/I+a9zxLMoiZx
 US0cEsYtOd8w9CLlJS7/rPuFHOGfqiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX1SuB3VzSnOOs
 3HSQk1vtbB1F/7nvwSwDxBvrc9nzxM3oI87fvetA7BYBB5YE8yhw1vSGMhxoWDQGLs8XNyxMycl
 h31ErytD4RILt6A5vudmVqmmyihEMTAkd6rrw42Wsf6dJb9uN+/5h1FeZdvHMToJasZrhCxpt9E
 jO3EtTI7YS88UMKm1mHk4JurEAE7s9wwhD5H5AnbT59YrwBq7EXTIXizCyvkbdCRTKv6zyy1xFU
 skwddVpTkiC1LjQ0IPHx2IlJdKYanpbhxW6BD6/TkO0c10UXDhtGMzMosdAaHhHB2KJMyqz9mqw
 g8lGEwHsXGmcRK5rYp5O9VzELZr7/Vbw+BHW9YrGDvKe97G9Vd7cOuNbTAuVMCAH6FDwIozINe3
 HC3nLven/MGwygeQFh55D6pVdMq16LEDk0GNR4FmYIn+GZ+2zZFU7mWbD6OSYFVPY/1vbEfcTJx
 mYnIkbSzWiVv0AHL6EA==
X-Proofpoint-ORIG-GUID: BHP0Ul5uLNaUa7TOgae-ww7eKcIdYz9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
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

-- 
2.34.1


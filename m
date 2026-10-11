Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A199314D34
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748791; cv=none; b=C/Fo2bAGZ3QXbooxIz0D0rqIrOXKHVSR11FyyXAgb4bhiZsp7wLd/mA3Ng6+cPmDVH0ecb6F/btCX1MmHNA8qfbYINpgrYseuGzh5obf7uLK7eclJ/ME/iXz+K/Rm/NSbhUggk/GWFpxdRwsHFxzmNOZ3j+O33rjj06mk/z19WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748791; c=relaxed/simple;
	bh=pXI6OlPwMpEo6kmDbz1z2982+JLE5t9Xdu4oOD+wfvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gM11U79LA2hSUg5Yu6Vq1cuJlBWfy5ds0JrKchE8om8mnS1NJCcqTTYZLLQ7i66/v9DMS5sNupDO6ANxqLW/53hALM5m4XBfcdJFIGmKgNnkCpcvaBM7MTemwBEBnyayYq2dNoNbj0TnAkqYuEwFCFMySTihadg0PIHDLMmyYAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH2TRf1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7KkBrJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH2TRf1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7KkBrJi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BIOWdP2751466
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 19:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QCffxlhXptHA2fxCamUbUo
	Ww67cvQ96kdRlJhyvXZ1c=; b=dH2TRf1n9RznsTHS8HIPyqincaWMt8/Y2gwX8H
	klTNyT6ZKAdpI4N7A8uIbXjEFETXl2QZICS0SRtdbQ/XRuP/k/WonehRr8qfF89G
	9nZzw+pSsiim5imcT4SCghtXrq4M7eEaxy5WglVETMM6U6vonnmMF43btQUuZSPI
	NDcaZjKnLCCvaD9eHDvp+EH44iXeKK7B9EbEPzDOukSXG0GzL2FOF1ATA9H9YBO5
	5VEe/y4cod6MzomvXrEsmKKxvcmhp/BAtvJXvvJVI92J2uUJTCyW3fGhnPAJp980
	F2jk0aQvvayPHW7Je0GR4E5Lrk8PljXUl2Lo5NV7uaxyQQBw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjkjcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 19:59:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9195c59ac8cso52220796d6.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791748788; x=1792353588; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QCffxlhXptHA2fxCamUbUoWw67cvQ96kdRlJhyvXZ1c=;
        b=X7KkBrJiKWmF/lcn9Yt7+Gce4HgOQlkmsT0sb0YkbmjoRUxMafrQa8R9Jquo1/+8ng
         c26y8Ezk8kvpjgRNozEWwyuf07chJxkOwG8r9IJEg0zmcpW8SmKPNk5N6J0bJB170ROL
         MG7Q1I/MwyPTyBnIT4niVgU9h0I1o61F6w+tXEbYfFg9wNzbDkailDxgT1c72BWAe26J
         OR3Kt6JNAgmFuLIFL9ROb5yv6GEDdC6xo7+Di1vK8tcLnNfZdyafrhudsLEKmFqZLU8d
         275GqZj9jVm7wINuhez/zDThOBaDMRUzKPqZguU1t6Vk4+JzE0AGWYY3wmyqy8cgCWQ9
         4D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748788; x=1792353588;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QCffxlhXptHA2fxCamUbUoWw67cvQ96kdRlJhyvXZ1c=;
        b=d9iBaRwytzS3S0v9C1wdeA82hoCPZw1Vvh++5aevLqG88zmj6DPPr885TJjcT5BL3X
         2nt28TJ3gCjooDhbS31Z7BbCGq5dHqh9qcm+u7Dr+++fB9oHUR+o0neBkQie9cNpPGJe
         IEUxk3yQwd+8REETg17vg1l1brDMiXuh8YwfzPeQdpcUmYJTzdWupek+gBPB6IEDZz4S
         wtSURNu4FVoCtzAseEtgn6KVLy+2yaGOV+14H6PV0Fk4Qgj+mNKTpq3Sb7dMOYucFjF+
         gMy4aABDvMMFDhP+jrkg1IWzxrdS8f97KXsTOly9sTqkDanmSaJwXdv+2Y457wyaZO+p
         //dA==
X-Forwarded-Encrypted: i=1; AKwUvByUaK7M9+MJkU8EskJPXTjBDKNDMNBfJXSfdU/+zVgT/b9/3joc4LC8AHWPVJXJ+cGvgdlqD0tiLVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOqUV42MB8qRa9p6AOpmtlxUGLYSupzn2GbJkMotapuW4TmjD5
	ScMpmc/dsSiDvkIsfrzWpHA6nxyfBPrCcD75mOGx8xdk6TmVNINOCJTMVrLA2G8OtkDdltdQcqY
	PFXzEW3/J5FvokbMZiQyxtRyggyH9etPhY8veVC7dgRwcy7vpgRXzakwb+lJsWQWNkJJr81g=
X-Gm-Gg: AYBFou30gWHH3Ws5UIfaF0HgnF/RIjSEplXtlT7nsELeXr795zVIyxGX0vFMObp3PLH
	FC3kqLX2Mh6iLy0VE5NOXLJMjgc+9CED1zOLpZoJKo6kJpG04p652NGM9eoKjldkvW4oNjbwLM5
	aPEF70gP04Frqud47cq++Mgb5TBj8tDCvWY4Ju/J0hI1yaqolsFnpHqOxRx6cGuaprwPt0CkORs
	yWHxx6fskDwX9x1IZxA0HQndLuoezGu4EMpNlTJ0nSN+ln3rnKeox4nb1rrSfI/dQ0J9aMS2QvU
	lWEU4rbM7zEXZWETTCXak52wLhhIn1NOtCZ5o6AWs15XJvs9asu8CsNNgtyH+S6VCsnYvDeHE0I
	69Q25qxa5
X-Received: by 2002:a05:620a:1707:b0:93e:a7e0:9a66 with SMTP id af79cd13be357-93ebd2253d0mr1364107685a.27.1791748788267;
        Sun, 11 Oct 2026 12:59:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:93e:a7e0:9a66 with SMTP id af79cd13be357-93ebd2253d0mr1364100285a.27.1791748786012;
        Sun, 11 Oct 2026 12:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm366759315e9.8.2026.10.11.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:59:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 22:59:35 +0300
Subject: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKbqy2oC/yXMyw6CMBBG4Vchs3YSSrior2JY1PYHx5hKOoUQC
 e9uxeW3OGcjRRQoXYuNIhZReYcMcyrIPWwYweKzqSqr1pTGMF7ysTw5AY9eHUckhJQr9tbWl84
 3TXceKPdTxCDr8b71f+t8f8Kl35D2/QvfIOVEfQAAAA==
X-Change-ID: 20261011-eliza-pcie-gdsc-retention-daa497d5578f
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pXI6OlPwMpEo6kmDbz1z2982+JLE5t9Xdu4oOD+wfvg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqy+qvhTh/eEOu4fVtb4hgNEZmNzojZKK4EdPSS
 jzlJPbkzWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCasvqrwAKCRAbX0TJAJUV
 VrRND/431MMDHKd/Z09ZznOjj0iswnwhULi7wboTwHE0c632L/uCWPKi5Z09baWOH10R1jyBOgS
 4ZCrdDz4xLv8OXr0lMR1O6OgnIcFsmgVLy1n774JRAsZ43AztWAPzgyKbFB0AibBS4kZTKCKh4x
 b1bISA//ZBM13xiAKzpgOGKtCfQD+3lstszo37bsW7f/akaI67cz9LQ90sNdhPQpYuq9dQl+W0t
 isBFImlQoRHR+DOzU7Ch1EOa4388KnsRQbyY4zV8cQgIaIzWJ2IB9HvlL402d1onfnYb0QJ7aU+
 12O2BwS2gMWLGd+ERWApT3cdYcwWxcfVO514WA6vF5Z+QY06TUCyt9JmK/j9A77Er/wpH1/Xd0B
 nddBAO8CeVaNloz4mGDPLd9egyZMwGXtZrbVXnljg2rW/TW65rIYKs18B/jRm5JXqONla563IAw
 4QkAR35t5Tl+/aoTmKLDnd/pZNXAszzkbLVVg3z3Fl7Tq2oHNiUVIiaOsaTDfzv5Nhl28TiIVT1
 xlhtRaoDFUUt5urHsgFcOkpnsf54ssb884bE18WONpDt3rbfWK0faiAtYIQl0dfiliMdjmUvgFF
 PUQTe6VfMhcGxfAtg00eKNj/5E7ZRO/nYfk5mcObrUhM9x7/hd7LqeTK7HDxFRjBqop3dflPl2N
 ECyVkaaucKf+oOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3OSBTYWx0ZWRfX9f7gRJtlfdNF
 aHODREQF5QnJFRrlSXmcMQW2Ta9Psm9Fm9bkMuFq79lccvs+b0c01Y2nTgeHHo6xWR04/HM4AMt
 iduiQ9XVk+RzgupsCAHAVyinpSY0s8f3GIJVHDd34ptn9/s92KC5sntKVEQYhxvGIuvh6N1ivty
 tXEj12Cq0XTddtcRp84ARLD80W4yscetS1xpL1BSKm4x+knhZDefOQwkeqa+nnNf/OvI4k4A8Y/
 0tQTPekRr1vN3Mem1H0OmjlKns0J5rpQAu77xx2OFyN/ko/qVsrMUPyRiwUpMdEMSlnkAxFRAQQ
 0Y2/WToq9W50BdlN3yNcZUtfIH75D9WmJ83ZNwfyS4htt8Tjql0qxTHF2vWsXguHPSGOHuCjtv7
 Gd7aV9P0hansObWWBaoRO8AJKPpnOxWAcGX0TT8kqtXnWLIzbSwkBi8EtfbpAR08b3JOPtBaGl9
 SESKvUhCznI11FSPqZg==
X-Proofpoint-ORIG-GUID: CLAPgJhN6vt10wXiWaBk1Hzf_RWvYTl-
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acbeab5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=x0TZ4X2153IZKJAi_hAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CLAPgJhN6vt10wXiWaBk1Hzf_RWvYTl-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3OSBTYWx0ZWRfXyA5JLgdQYeTK
 KL+zw2qIpg5G+LdkEgwNwWzcCwCDz8Q7eg04J8og9ZftWwE8Z6CQF+yoJO2vStqEqFZLiiJgSHq
 C34aJqw+lLwqIgBUTuEnUFGMLlRLXMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110079

When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
gets stuck off when powering back on, preventing the system from resuming.

Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
state across suspend and allow the system to resume.

Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 064771726e9b..21fd93a1f6b2 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -2715,7 +2715,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2729,7 +2729,7 @@ static struct gdsc gcc_pcie_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2743,7 +2743,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2757,7 +2757,7 @@ static struct gdsc gcc_pcie_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-eliza-pcie-gdsc-retention-daa497d5578f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


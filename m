Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81E486E53
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390182; cv=none; b=ZzF29qeKqFUz3EzkhXRDkfCo9LAjtP+qcrt+uUFIjckMJgQXCHSv34R7iRQ5V3SmWUWoSpgP0iKD3muznJMl55kRGU9YY6cdveN1pyNNWMu8OAv4XgkmVPnxyiGfu0KvnpNGUV/ifgx3AtCTU5cXglWkeE3uTdDXHSDpgul8Z70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390182; c=relaxed/simple;
	bh=rahoujyANmIs+SzbF411GraqoN5ZdYQDB5yRASGUxxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufmgcs6wPzzEtlHfPJlNLBN4B74YzP1gMkMbXA2Ds792MYmITa79dm1jL7y3D6Wya9CemPz02GD8fTw68vrpiV8Z7J2GLXHA2kK2hK8agNwEMMonUP1ybydPFxDHgDigTwGxMbpIYJcMUlLt1bNR9NIurZsHDSjdsPOD/qJfUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2JuHm3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekN13vQ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2JuHm3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekN13vQ5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFqa406712
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=; b=P2JuHm3inMJI45L9
	sHNiRBESsPdey5/wq3iubb5+D00ZW+GaclkJPtE42yMJ8Ytv9uR4U5fxQ64kU27b
	EWcuTcsM0SJLNVjVJ9L5UN12UQao1C1ln407b/UmzlOSynLgnfe2dF4o4nWf2q6r
	M4ZV0oG9opM74JwhbwOZlL3r4i7bHSgGiyRGJAaA/XjboBc/zVLq9cdHw8zrtUiq
	fcymDXra/cGOu0H0pPYAuMAudmdNezjrYL1l3KkwQbYbPIijzwHIszhD2AdnmHx/
	lMhF/SPvAQUJwx2q6C6d6WDeM1Usx8/9STLiHVVXvdKxPPU1FK8c132OrDGeMYjR
	8OBLEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f1847fb9so356484885a.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390179; x=1789994979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=;
        b=ekN13vQ5LHiysMtxGrSynLc3mkj+sogZ5hkj3Deu8YDBgZXMMIPAZAKYB70bLi1jcJ
         p8hDK0+pLmhhHnRl/0Xj4+dRZ8ZaUb29UpP+NfzZYZlh6ceVTj+c4eVpTHtx+tUu9448
         qdnJgkwfwIYZvlOpj7svwGFk/huVbLVOuPyDyzpbDKj8r34WhOI+PzVDNJ5Q20aEFZXJ
         WGM5ovcN8mvxiTwWxOeWdy1O8538KhvGZVcJVI008jHhcLYB0RKDgI5tPND5eSOL2GFa
         ZVrGMSuRFDCUkHjKA2e+MjzNvphfQnQ6Ax+Bvv9pFG7YVYUYuhxdDelUA3RrERTj6HF0
         vL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390179; x=1789994979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=;
        b=R9nt/IcHY1/44JHdSZXH84SJpqfv0xvGrfrtCIzJdioHjwWgBk1vKbuKJSnZ1vFp8s
         2iPx63csOqLF5kAyyOcBIciBVBK+orYUhBZh64vFtSvLbv2z0Waobn2rB1gw3ky9x8P2
         SxVf31Paa0NH6hmRo9x37x/7Tufi/i6yTZsBmGH68YGgabCjop5utZ/+Mp3PSkTlLcyX
         sUjKo96RR1H3wwP2EjF6tcGWPj59JFCQVbHBpUZq4G6LihykOwmMTQm3ojYKoFMiVYI9
         XFf/oq6krjbnZgkC1Fj9dnQO1tPtGTpeDg0kVMkDHrkHk3eAiCBeU8fXVhI8M6vfkRap
         QBOQ==
X-Forwarded-Encrypted: i=1; AKwUvByA2rBQkwxhFD12HgEVUfwBaCgz0ML8A/IOjZBOW8YKqNgmPwwX3I0e+lvkUkVd6tZ3UDp1qsBH3KY=@vger.kernel.org
X-Gm-Message-State: AFuF++kn1HZpDe4mnQWMHw7qB5Qwe5UIH28yn+ym5or1JiJ1HJXHD+vL
	jj11vyCR14aPIpJSXQSBfwvYxEJxc90YXwq52r9obHao2ogGbGCOfb3p8J1lg4GR4q9yynVhIKx
	LIS+obkfvfTdM/ZiK28qoQf2Ev8RNoripR580C3x4V44dsPGQw30x89GOmiXKd0o=
X-Gm-Gg: AYBFou0VJ+6TrMUJKQsnefPe1SCg2zpphvV/Jhxa02zReiCkDoDayvJbvjDAi2RyP4d
	suoIGuzMNRGx57DX0hwukUmbJ0blMgcYClBzEdci1CUanYDgoA7bDJbTvb4MT9b5meIxiQjCwAg
	62CVyUnnJV9CGpFlj1d3fcvbwPfq9LRcNXECzLflYP3eMyjkxtCIOy8wxm1bIEQ0E04A8soh5sG
	6ILWLCw3YIOmPfUQluBfwtquvDd/w2xU7UqYmk/R7oatRQ/Qp7pPL18eYHgi3Q+vt2hFSl+PbwO
	0JfjxeQJ0Mt4B1jslfVFpzmjMmvqwXUZq4WnstSJ5XHoZqmfBmwqnqTaw3qmcx8QqaSpHfRB2jb
	YX2dXBfM7
X-Received: by 2002:a05:620a:6cc8:b0:939:f5c4:ae5c with SMTP id af79cd13be357-93a29a946e7mr332045185a.43.1789390178369;
        Mon, 14 Sep 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc8:b0:939:f5c4:ae5c with SMTP id af79cd13be357-93a29a946e7mr332038585a.43.1789390177779;
        Mon, 14 Sep 2026 05:49:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:35 +0300
Subject: [PATCH v4 36/52] clk: qcom: gcc-x1e80100: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-36-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rahoujyANmIs+SzbF411GraqoN5ZdYQDB5yRASGUxxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zupLxzgXL5Jjx0LOhc42oZRuj2jWA4C1Dhn
 FYWJkXw8QWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7gAKCRAbX0TJAJUV
 VpJNEACHTevNtfrGByvkSQP8o6CxNMJfJ2ofJr9OZ+voLW4pZgQ5RzKm9vpS02jGm3CZPHvVee7
 PaWWRaFjZkEtH5hKI240ShvwTXVjxbg39wwrKUmVXUKmavjvXR26axPsqXjauegEU9gCeg9+bVB
 AS+strLcLYYZirWJEriUHbPYIClwQNe/sM96+CR6uDa091pNAMn/c7PQiiu66SlE6+FN0XVhqyR
 9iprlul5/4EyLjn/u2jgOKY2fN3XS4oYBPVLwMmnyvmsfi2dT7ZCcIDk1M+Pg0DNBsBelFVNUbr
 p7Zfo1EAvUFEtCzbRwD4tg/sIOuxIj2sp9dwyRoEkl5EQpgD1tAoMRvjxc7urJC/AotYzO6VVT6
 k6/joFHWigqm4QNuxa53vjE03gJiFVdniVDtKozLwuLc9Lo6vDd1vvw8SxsIALBBFjWkL9tpQUo
 ZCrv13UP/lue03vodx3mRB0UkkcdgCiyEmXOXk/qxcufNsa2++PALJB8cOjVBYVDJcYT/29T0p8
 30hDDW4GVlmpbRYozt2YXYbipzDq6i9WKBlUfOV5SSZcoHUMoWSQwMPRy0tXtaARn+WejE57Q7n
 g9kMGcZSsl9EWSdjOGEHAfUmQtOKCiZ5BHYTsegp2+KsNf9STRpgs3TlIj5UHnH/YgIowmGJmUT
 3VA4i+Ad/+1YLWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 39oUJlR2hmFo5ZKn2AQwHVlTyrJWC1DZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+H+wLYcaTgMy
 JSUkrObRNm6aTJH5zAc+s/gHVJpfxdX7qoqjlHR0CUqFp192B55prM6XCGW7GgMbImO/zyU6AaV
 ZzGnGW+tqyHRHZyaGaH1waGdwft7O9mhCAzfinLcLELEFKP4gHiJlpAhEOTqVesT+nMwf4tfJzs
 D6Sw2RvPbUXZXJIi+DV1YrhXgQBMuHs44hbO1XX/rV+npL2OTKlXoJjQbH9WQM31sAY8tXV6NwP
 dysqrjAcnH3Avut9bcx5xPpB9e00k8AIOI1qmwCM4tMdBgCqD7ZI1MdPfb0cCAl10hnPVYtBtLq
 c7PvcVYd7kXHFEAyYXpNhIGoaNhKrnUEjhBf8ZKg6rbpf9zJFGKZD9hc62o7GNojVft9YWB8N7n
 uyfUNIIsZDyFECoMULpr7rXiqljdp75QwzCewAdRyyO5j6kW3+WxHcOe8AsGndasRBJqzwow+Mj
 D2GLGpZWuW+oOixqbfg==
X-Proofpoint-GUID: 39oUJlR2hmFo5ZKn2AQwHVlTyrJWC1DZ
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7iF553TPtIAX
 4oPOilGORanKG55Tkux7tGzOpK2afNf6ZXzPWJ0SB2X+xbVtEO1rjgAqC5/XoHOPAMwvRDqCtQB
 AOBjrkx+0uBvFjpF+IvSYu+t1Ehr2HA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8c146d62c077..832633a85f1a 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
 	.gdscs = gcc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
2.54.0


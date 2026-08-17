Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F294435535
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972850; cv=none; b=Sf1Oq74qMuY1uzaV6zbF0Lxd/WSuzOa4VRo9XnZQUz2oNzaLzIezfe0fn4yk0RFSnepxLZeNAizsPPga8KND9ewC3++n3jucI8Sjpz9+O2qcFUKQvOapKJuThgu4V7SFgdBEAnHsKCRQCl/tw6GVXYURnHyKfv2hEYhV4A61MVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972850; c=relaxed/simple;
	bh=jB9+En6C0wpuP3D8iuDZbNRYZSDkZeqCj5UjzMgKESs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyQI6zzb3C9pFVjRx+fL8hkjYYowIuptgDldwdlZlFlNAQB+Ty6AdY1EOH7R0r4AmBiWzOgQvcu0y1e6J/0oVlxtU3hwOxJ2j2O0oVYcM+ebMxqR+HyjPsI2HhBzKb1upT9gQ3J7HVaEMNPXv5nKjbYURnJH+mXNFz+T++1m5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAgyUF+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Obyrx0w6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAgyUF+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Obyrx0w6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5rKC2008356
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=; b=iAgyUF+3adJhRbYC
	QGE5a7WprO0TC42n8ntx8pOcHns3jtk1c/RdvleDXLbxWyeuHEAWKExP26f3WpMJ
	8WuOH1KfektebBJ0kTeGsQJ5ahf08nQBKQzCk4z3gqQSwk9cRXKjC7oB91OGLH8M
	YM/UgjtyiBWXxv/Cu5nUZysGxtMMICPBVUFddbegHqK5WQ9KdrHVFh0VVx/0xTZA
	DjIKyaG5poFrRzlkliOuPRsGw774QCZE7UYLui+fuPYutBSkG+F9WwJO4RjJln8h
	ghPjnO0h5P5jBGbWi4d+4dfFNeMs6yg3HsvqVkKFqsy79AUYn1Bxh/nHI8SNgU4v
	nW9NqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h2hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 13:20:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7ef17031so2409471cf.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972848; x=1787577648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=Obyrx0w6MesthIQ6rULf71kIpTq4MGgqisZyPlTF/ZadMaXVyhco1FV762gQEvxHNs
         RTKS+sdTTt9fMnGsElkCU1YAq0FK02KQROINlAFg9pmGXJcEYjnFZOq6MU3wLSsgBkDS
         AKzo63HNcdomf6N4JqGZwg+HkJcRWZoonphzbBDg1kkS00+MZo8IoLCE1PhNwy9Sf5VL
         YvNe5ebqSdkXVvUZGcDmREwWbgSI55vhOX3MM+YsoVDTYvd9fxmFsisBc3YLmL3M6oTV
         P8UsgrcbOhEyUmZYQ+xLdomKPfacbMn/ng9v3S2cLbirbtzRn7xHTrtBLuR3G9QcHT7Z
         NJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972848; x=1787577648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=sVEWhnRxsiKi0f+ELX8XKX2iDwepjNQbpIz1tl6gT4jBSQCCn4xk1CqXj2kpi0eVnj
         Ja52fK4Dil9M7jZ8xddVOTWzZvreql38Hw1FYxYgxUO+R0+NGt4Dlz2kNKUA5fx2pkck
         n9IqyO4CMt0PfjqHHG0SDnCE0gc+D39tAQUMmtCbvM8eeZh9BC7chnE675Y5jP+P8hxZ
         oxMnMuYgyF+8mCudwLiSHey/qN0R53f0JlYUoa77ANoGMuyk4u+8FDQlhpT4kJKu9cl6
         p6LIDddnQD7z7OnhCkcZQTOpd6X0ntuqhYhP+UIGujazNBTZSzhcK0BNinHGCZFIALwS
         bEQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr68ovjbWiNiwqwL6sf6+yg/6fCHgirj/vwbSXVudB1Th6z27eCNqw3a3BT3pL22jUBxJPQO+bDW+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvz233n8CbBxwqDmYYf/H5j7/wneQ6hl6LMKBZvmSqPYYOr+G
	eZWzz0m91klqQE2IVXIwM1O0Ntcp6x0bw7CdncajFI7CczaS9V8/5h6q9MC6DxQxirJYVm04soP
	q4kqYx/+fNSLjinte1Q5ddvyo5vpucwFmeS+PVkd2n54wcn9T3qqYT/ZB7sopQXY=
X-Gm-Gg: AR+sD13YKYNuetdejQ5eFRsjB5+HQNB9RZIJUolyz3Sbf9wpn7t8/p5Gmk4IwAulXvn
	0xn0rROQhqPrVnzOhCKM43hTDUb7mLn3bqc6Ke97oW6xCHAxAw24MmnjHQmOAgRXS0Uj0rVrIFT
	k2wqg0RhewO4lo9ZH4FeLvdWJuyTqdMJPjggvj0cu1LBOY1rq6USl44vt9XcGhu43zYSSsrgXIQ
	G9ZM5OOX2Gud5Ia4iJjuVOVPRsEB2qE0tnkO9R0ocNea8wPLVAAxUjTwfqA64xppK3L+qA/9d4o
	86BuiBgLqbg3rCJjHDUyAmWv1CdJzp7istPtL0DKMxvpcOiXezK+cI3jdwOm+Anftrd/Jb1P4ns
	oNeJubxb2yErdz0cHKllsyGPF
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197961cf.1.1786972847673;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197221cf.1.1786972847102;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:46 -0700 (PDT)
Message-ID: <a7a7257b-b1df-41d6-bfb9-9496f00bb25b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sDOD70YG0wFuSpjl_2BqXHSPdHb9XVaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX7JRV15gpD/8U
 QLYqTn5fCc7SESZvrPs+odjK7HeKGbnEpumQEzIg1MqFyA/V/i7kcjJXnA+EbWiZNmNPv/FfA1S
 5hmEwwOPx6QBgjbhZXXKJ4CMFShRxSk=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a830ab0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sDOD70YG0wFuSpjl_2BqXHSPdHb9XVaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX3oBHzSeP+ZNU
 TYPZzT0Up8rmLKqS958FdKt60kDcpWjgo+E0C8vFhDwZtCAvb1nORg/89vdLUDMfXWuGli/6Wpp
 rog/oeP5KuyihyBzRg/dCf/2Y8SQMTRks3CdjCT9unNKz3D2GJj7C2045uK/iLCKs/2kpA6ndDg
 B8IcS/MCxukp77cBByPuI+Jh/2DlUm+5r7a7uZkrKpQBh9z1+m32AgFAW/HZ+ve4mOxii3AFE6g
 rvRwJaZo6vkRrQ3csrTPZIrqgNnpoMZYmJew1bJQewORLxjzT0XahRsckUueZl6N922We4zwj/k
 RyYbl4Kh0ve3OZL6bhyk7tylb3KhMSDv7xkzV7uvKDroESt1lDnmnLbbqeL/z+E8W6mdd6Djx22
 01zZlXwC484Rt9NOTv+oumBzNFOBFj+u9oQDQNOYqF/DBD29+IWqbJmR7mMV7aLGzo9YTBFIGc8
 5NyF9UO20S0VmL7uBNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

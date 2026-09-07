Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2919453A57
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777527; cv=none; b=G7H51YAxkPOZkIfjE6nGFaHPaQSa49Ooprh6fQT/I0RwPZe8UaBcTE/DH5/LREveSnglDln9K/e8hnKMYjRVsLqKIZSwHWBjrv+4meO1VjNo1raF3BQKwRYP9VvmHoYGK4j7MRRebN8d2E9XMchw3dTSd9+6bTBMwMThrnTtUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777527; c=relaxed/simple;
	bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0ak3nT7sqwbHNrU6xq6FDl0aJdHN9IGOksSIYWffryN94aYXSSAsU9WYTb4VV4P069YuvaWrAitZ+otomTSv24SBdxPYKJem/hl06QQC/TD3cHPGkuwG3t6caAF9KfPUAMQh4n4s2yNdKfcb7b83Q1KWadYQt2EteVzU3Yf16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrY+zChE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5mDQLQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrY+zChE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5mDQLQN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879befd3072395
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 10:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=20LrBTk7+xHKrR1eeJdTqXRk
	QeM8O5I2RAnmQi7GLEw=; b=MrY+zChEQQm6qp+doFuSD5i4lPkXLV1rvUDW5aH5
	rlgfO72gukLe06Uu8jwT2Z7WUObGCbRR8q+fOleBCteaQj8pEWheGLvWGcg12OfY
	PT2RKNCF0Bc8BE98HfJA8z7ysb4N/pqzLB7GXsujDk/Mi6DkiV7hFA7IHlAMsO+C
	/6xZdYXF/YfREQEdyPLZpYeFZfRM4e6PKEgRGhPeaUIrfKTwTcV0EjgGvJsGh9Ps
	i/uETnId/zeMUZ+KmbZjmqsSDe8HgYvpPmcmTPROPABIFdCBz0hiDSd4hhQSAgYU
	r3RaWb/G4DMSZsyjdhhEZ9/eU2RHUItfck52mZv7MPdVQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkt9yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 10:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939281526e1so232461085a.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777524; x=1789382324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
        b=Y5mDQLQN6+nPMpCXVGRBFVDONlu+HnJhYaNNCSwFG+SdbqMvLtrPPl7z0VGJcC5T7x
         3d8EQJVnhBMpMouykS55qGXB2ERn1mRJ3BbKCSCOEJCJ0IybKT3cwg+UzvC55NiD9BUJ
         OA1W0+9ffKdQ54TWY+PRCxpEvqzpo9hVg8FVWI6y2vYTJJUkp9S1ZOVhknBbZkUvHiZZ
         NB+fcxt/im5qpczX5nTcJqkw30Cjn+b5/ym0PY0iNi9ppwul7WpHDul7sdOOT88WgpD6
         oS1F1QXJgBwxpAQOdd3fpTxZ/0Q92nBHM9l7ZwzTWithYzph6UdNxJM6WdQxHET60Jov
         BzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777524; x=1789382324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
        b=UKoRvpN/3jLsW/C/Z1FhmdabY+18dISiHyFrs0aIMHHfMP4aoY4N0furcHXgkREpf9
         fGgbebog7Wyty/+eI+WeAzdFb3rtm0UwCfLobOl3PXoIhnb00AJYxuGgJyNtrAPI+fYA
         44x371SzLFt6FzqEaMPHM2I7HHYFe4OZm3Lj3dAVgCh00VwSh2e0ZfGL9uIpxOtxWQ6J
         bhpw33XMvAvyjzBceN4gihMVc1H+FUoPpiiviIdguXdMGo2y9QcnXFi25KgWRkTrSO1q
         TG+WmK/O3qO/gT+5Sa69F8SsfN4qLKgbDnn+9DFY48eMh/26PIl/eXGTs9g61W99oIbW
         vomw==
X-Forwarded-Encrypted: i=1; AKwUvByEzvwxGIrZt5Z0fYzX0bZV8H9t2Frwujzn24ggDNG+C4LbIT8f5b8nAX6GBytfUJSz8VUlUwkKFPE=@vger.kernel.org
X-Gm-Message-State: AFuF++lNzpDA+4YvHPQ+FWML1RcHv60O3lteK7KxINxZSGtw5HSdSOf3
	KmyeMQICrKL4fpHd1ff7vC09qWXr1Rryq8+28TV8sSisayPk7KZjIYQnbN1E5jTHP+VaGKSQqGp
	fQzMroIwmDcgBu83lF/WJhVD3gtYf3RcucOejPQxvJ/hl9XDweC6nDN6x4GQ1Ic4=
X-Gm-Gg: AYBFou3PPa8neNrjBXYcosVLSS3+uf3RZ6/otcbJEivWUKyUzvZJu/8cuZwbzZxY2ZJ
	c0avLliV9ppNaLOKGSfCX0ko3VE5dWoy3NKe9aYI28zqUeXawTjuGmiEWD1NFpScMVfeSwguom4
	aSqra/6gilsBndHt7+FC7xTgy+uxedUfv9P3zzS4ZlDwoz4UcnEVzHihWc/ErW3yMOpByF/ZPpT
	DAP0re3XyJEcML9h/pkng4WHLHu4Imj0d9zaTjHQJ78hHMv2dcxAfWE2WOC9YFzRn8Obu7sVYjj
	KfPnDG66NKf3g/zVv9KTx/l3b3L8hdmKhg+SEcgF/3izElaVQJMx9UEGFqCaPBMgmA5m1dbBnt4
	Znhd3Woqmg8cixA==
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr2091272485a.14.1788777523714;
        Mon, 07 Sep 2026 03:38:43 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr2091268385a.14.1788777523097;
        Mon, 07 Sep 2026 03:38:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5941cb6sm1280275e9.4.2026.09.07.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:38:41 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:38:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <jzc45x7mqbcxon227yv6bthbx5l7uicz7susv5kqxbaoammqf5@lr5cxiqrkrfa>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfX68ktlWLyi4ut
 IyVLIjqs13gsd79I/TUU1vBH9AsUn89Uj5hXlp88XN9mF5WrVKvytN99xs2Gjv3qZB61oqFutbN
 jEPP1ScJxx8+j/ROmsOuJ0KWBLE1VFficAy5SFeOCDiW4aJiZleq59kr7nccISf6kcQSd7DXN2R
 RNnSHQfzIUieot/J825tb7JEqMhtlzMoAO2E+3SLdeVF/T3ERHceb4O1fuPH1PQg0taLwaX///Y
 qFIkJGjQDpcZVtkqP57pqHkliycSo5WeSeTiHBGvlmdGGvDjMoyQPjMjBkFjo9nwkTPYrQuutan
 IgY3ZgZ480bpJLX+eHrMXKGidYo7zeHD++FfYtk0h25znzmJEPJA2awJAbSeOAgT0FUM9mLX5/c
 OMba8CjHIgHZI+epAUZ/jWJfySbwV4CrLkCk6+3FbsPhsk4Gy8Eyo0WndHkbAf5kDM/qLQIcFCA
 T+3Z34VkehRF57GQ3OA==
X-Proofpoint-GUID: SXx_qwp3MbOCWmFWhCHD4uzfiF8Gu0xu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfXwEaRi7b0fmFa
 tE820SfnOYMPBVZYTUCGLAii0uZRay1CPZcWap6ACNPGPuORQlhSseYo7uBb5wy6CHQirxZ1idc
 Ec2QRh8oB/suGHnFDWDXQeDcp9817y4=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e9434 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JYGUOujTUg0PU0TV5iIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SXx_qwp3MbOCWmFWhCHD4uzfiF8Gu0xu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070116

On 26-09-07 13:56:14, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.

Wrap this line around, please.

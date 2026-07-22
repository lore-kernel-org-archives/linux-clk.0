Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814E635CB6A
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688147; cv=none; b=HmxEE7H/x5MYzoNPYOVDzANnTWcf6f2NK4MZq6W9oZ4dFkyvuy1eg0Oeh5KTztGztTMseQLQQhUXveGDYACTwcdkNVSHo/FIYBOzXx/PNCZ5VeiuQcIUBLm2dEqw2Ln+iagtVckkEJ5yAwvDjEOyTEosfIV1CMmmlQsCSt/sFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688147; c=relaxed/simple;
	bh=+jEgsXPIlpAf/t6BKT7RmtRHh01YWYWKVlVQ/dPgotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFbzj+EL/hYlhpIC5VquWr9c8xMtDYhZHNVhB7/Lhwn3mTL3zyXBXf/nW2Y8tKUM0pzz1kK+O4FpiXgKBtCndI10x6S5usPoq3NNJRkkfCfCKa0IjSHtv+ysgGHWOKsMEfD73KnjYrZarzEt1vnJSgQs5xeoW8rZkQ++CmjR1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIxlisE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ6SbIeG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIxlisE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ6SbIeG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CEEW3275475
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yXuAeo8pGEzyDVWBXPKIatrC
	tMlfuBJ15P+LipzkFi4=; b=gIxlisE0cD/uz3lZAwRj4vD5mCzi8OnjnM2qwHaW
	93hpFeQ5P5wWJTuMGbUE28kS9rTI6lDtfm63f0B/JrOeguaQyb6hapGXLTg49jXp
	uWXtMeIjLHnMZKap57wlSCsKOCvmK37HcT5QETO8IHx8HpC5nqdYN9h3ZcfylEzm
	GQEtthBedRIB3nEfLwatpkml9ZZR8+zbWvXWLIdGYhvW9YmReiAQkUJ9aVI6grG9
	Xk1BsjYaQCRBJ1ePYTKEkyHhNXxYohJxgKXzRrGSY61APouVIwmTqrU3Kb9OIybg
	0sTmu0k1tEFeCdgy5lxnipoM7aLlRSb3TwmGKvEiQ4czQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeb86h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso219536355ad.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 19:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784688144; x=1785292944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXuAeo8pGEzyDVWBXPKIatrCtMlfuBJ15P+LipzkFi4=;
        b=dQ6SbIeGyi+Gomrxu67Ekw6qdA+Grr7fxta4K/r+3565+bv1ZeZhFsn4xY0GNlt3Tf
         g6W5fx8Ol2o4VSnRIqZIPzjnGvllN9JTikV6eAbTXGSzYKjzJ6KkbOuGmZwiGnWl3Yaq
         94et9DP6P2Xy5jKCbJVRExtO4pVFzedREID+p8AJl7x6A5xMTRFy+lRGcvyhsVkkFnr5
         p5uizvnrjY9h9HlhPLy81qdpVfkVtHBMEOq4Aw0imKMKXvNMdAjBMHIuVo6iIbv5hK2n
         +nrXOUq2jXb+hT0ireqHZVRcIvV6VmD5Yg+qrm8gGx3quuQ4PRFJrJa3GBkxP7zLuhkz
         nAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784688144; x=1785292944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXuAeo8pGEzyDVWBXPKIatrCtMlfuBJ15P+LipzkFi4=;
        b=bR2QEbKPzKcwfEq/1MrBiGz2zeD/QFAgCFO/R9U4/GeOOFhG4tKwIt3maBNmFa6Ab5
         2KxbckV5iOS7qO21klc83d3lwh37sw99mrNV3qYwoxy5oQa1lPH+SwOKWNc/VyYRD8tk
         UPX464Iig1x/XQvdylPDYbD5JAiGpRTqnEK4IDyxxY+62lzcRmTgS74W0HMCc/cdAwhq
         HppZ0dfaKxZI3qrHkc3nPUN3/ftPIn9SpVcomKPtu+myus0rvibcneq/eKn85ZUoMH7Y
         sc8P2OaMpe7pD/7aJhqVlPGtaVl+6mJIkl9chyg6hxMiuEqblx42TW80CW33YU2QxuC0
         9OQA==
X-Forwarded-Encrypted: i=1; AHgh+RryQRpT2kCylkmIa5URZyOKg9Ar/Eyxn6Tc/P1cx0lw3fksjnECGCMPmgkB53V5PuUyh3aRX918LWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1IHQ58JGw1ISV5Noj9xGSDP+UjGqlxyqjOT5l1nwLmk66Lcku
	kzhTvKdKzQ+bH6M2/7wZWf/PhKe3HgohjJ3lcNf5Nj2KXr/7CKI+NyesUJZWVAloxReSXAz+kju
	1aslvQLitNoyKZo12Wlumf7JB6u+Vbbc1SSUozuOW6U1l3fh+fSZJE1HDZtd1o4k=
X-Gm-Gg: AR+sD13Y6OplWpQvY7eUGJjgxQeEtXKeB3hVCvvxfRm6q6AAKMcto1fqlOqB6JLUTZ0
	GRqTGWKRFAo8Pn+qHJoHVHpB0WcYVoYfMfC/Ijzz+1W4nmqQKc8mLjOIkKNwBjZ9j/OVzl95sA3
	DrFm5xm75MnEsPVB0E5zSmjlWVT00JneJPtB+RlQVqmAkA3PjC63nn/xlWHKlsmbrHePhjWl/rI
	7fdtPhsJTtN3FdCUGyA+Zfkcc2SfrYeK7vRM/8iEDP/pZvkGPxPgZXmFG11hQfOV852+AoXyCpR
	kBx/IIptdRlpwZkyudeQaM4vT0R2VG5xKf1bNSdlYwSlQN+ZwWpAnjPn5Q1/ATTpfuBy8vy3QjJ
	unFTmY7Fri1Xa4JKHLWev/eRrIFhP7PAoAfoAxNPFReM=
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr225540045ad.43.1784688144361;
        Tue, 21 Jul 2026 19:42:24 -0700 (PDT)
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr225539865ad.43.1784688143966;
        Tue, 21 Jul 2026 19:42:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm3868069eec.30.2026.07.21.19.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:42:23 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:42:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Message-ID: <amAuCHuElKhkoIfM@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3ApmUfZqz75JFXJ5RoAswYyeIaITgwvM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMyBTYWx0ZWRfX5Tyde+ObFUaG
 7te/K3yFW2gBDp0TtRDoQr6GMwt3cHfQGQiuNm/8YvLZxFNLNw7IhgPg8lU0wJbAUGG6WEMyoS9
 MspPcW+pGCZ/mAmytV3+gKaUcVO6Q+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMyBTYWx0ZWRfX5fWGrEVrENy2
 Hm6aJGljiQM8ctNCusopTH6GCS7BfOzK665nl8ZDPsT0QPoBOk1Q7b4k5euwOl1GHfUMaTeJpB3
 dX/7dDvtgoWbQHfLsZ4Hv1bGf8c7LfZpPGYUdE4rKL6Dpd9XcAjf/GWbO/aZoOzq49tzbNXo9HF
 zOokUCoHdj1IZvNSL31k6MhAigI/fUKmfmg2/GfcZoIGYnXDGMVJ5ItVxC2pSqepSnDF8bbf1JH
 9ASNTr5fSJi5/cVk4OaXxEz0zHxc8lGw+7y0UE+yrT1lPEaERsWbPeIwHcJqznJo2zOO1XpHb3J
 Pv2Ral571Yoh1RvTAOFKOknRBrHH1Z9qHTJZezVAie5LTtWhD7uAamumgA9Lu79ps2wx/QjMr/f
 0i4MF9oUC7QOiKcZfcpJzSJESZQyPGIEPMU6kxg+oWCToxwhD1LVb3B68QopwO0uImy+LY2yDxo
 QmxrGgFLf5GZNCMfXtA==
X-Proofpoint-GUID: 3ApmUfZqz75JFXJ5RoAswYyeIaITgwvM
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a602e11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cQiK_xN199hq2pa4WXYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220023

On Tue, Jul 21, 2026 at 12:37:21PM +0530, Taniya Das wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

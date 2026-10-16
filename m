Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339B4A482A
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157883; cv=none; b=Ra2vC1IXLVmb49UTiOs0JMI4zK/hcs6LAthvISjOxBa8WL7OaLbM5hqCqln9oUnueL29dejG9kYlhN+Py0fQfmCW7k1CNrkz7dZqcUabAgruDYR+K+X8vFLMX6vzULKWcI6PeyNrvpNXL3wu5NrZp6HRBgrUhVvttG8xg+PEThQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157883; c=relaxed/simple;
	bh=SS5aXk6Z+00260HWjb2yBKL0EsvuOVsfTLIH1GHielI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu99CLSpVTNu7WK/tnJAfGehPm/tKDry3kYAXI14vkyAZDmm3JwgiVZ5fP4DqhWs1QyK1lReRfPLo6GlR/VOX23J4lttrskC5+9r2QAFcNgS4X8+mNFDY2ZProaWpGfYATqVKsZz0tP+BdK3rnaGjnLmioDap9iAiBlGqi3a09U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O14M54xF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmIlZKij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O14M54xF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmIlZKij"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAPpp2496922
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=; b=O14M54xFQmjisn3I
	egdfMsm2hE43GxzhnmQ+X+SQca5uEgstY+NyEiDtdB9UmCYqi4fPfVHXjR8Pr5sM
	a55crih+/B/gwX8JiSVTqYqsFDyG8sqBafOO/tIXy+/xCaEEdTm546WeDFUPjHe/
	QcVsQ6vLEuX13rqObdj5qeT71wDBTYZv/58cgJ5R6KGHqlC0qAntAWej3fgtgR1b
	ffo7R1dBUZNDOSw9yzIQbhqOXGVBm1RX2NPKjgIrzdbg3Lddh5qCXQZsucnluQqh
	M7TiWd/rcg1inM+F87xEQVE21x/iQ24i3fBAYDqPMbif2xLLA5iE92BJ5xyiqR7J
	seJTVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3x93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 13:38:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so20512685a.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157880; x=1792762680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=;
        b=UmIlZKijOppkVzNnOlJ8YilN1MRI8XzFKd5RGTFpaWPXObRThRbOS7eSpjGC0RAAlQ
         vob7c12F+yrlqcnx3V6JpFKsaTHfsbuSEiGCDxLWGojpD3slS7DoYfLkWnj27CFwaG44
         Q/eNfT9ZFcNPm9OBSS6UrFxL7sshDVdLP6vAtA4lG79Hjaw4RUegfbfKKmBoUGfXp/dp
         Ev3zZ0HaHFw0/7YHoiqA83gjDdMKcxz4XDXq5JrED7+YQZW9syBAWklDxAMKPo8U3uDI
         mMXwwxf8VnMd9ckjHaFxZjMJP5AsJzE3u9YDJktgFsCx9nObnEJ68u1sFGiCt3E3SiMs
         Yiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157880; x=1792762680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=;
        b=R0hEen0RhRA9XJaa/nSar23A3wayfs8vHJEYSKE2St3Ua3olOM4IfvufTJZe419/fV
         MUfU+95aydK09FqYqFXVnuLvikkurhSgCWoS1PIIxsSGOhOBtAzMSEGrfCS1qSMbhUjG
         7L7647XYSkwueVzYZ3MB38N7hzqSVUgWRHB8br6L3rpvc+6bUaVHO+ful5Bdixbpnrxh
         iIaeUJfaU7VXH9YndZBtj7QgTCV9ajybk+G+3OXYBhBhhNjXsx0LTTWxqQFprQGkaed8
         tnKMS/XXk2COOGPtXKrt1R/b0MgAzZuv5H8hM2W69NFPw9bvBmjpN3Bbu3YC2Ykjx3uq
         VtVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkURenUtkWyZx604Xd5jakcQtPju65CDt8sqHAyIsoupQuRz6fO4WyQEWKAlbbb90TQFYW6Id6Zyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYImubfgpVuDD0mn1OSsVCp2v9o2maXrxcVauqdBAxmZxLrOxXiZ
	S7SgaJOP76XBO8KV3AipvpmLuBrDrUAL6MqTspiT8ybwiUZb+PepmcDGmSPV77TBFfUH2BWIWDl
	yTJtc1uwNnpaSZ1ncZVoijq/2CzGF2XjHZ1rHopx2cGa+9D5YYy9S5K9hSeCCl0Q=
X-Gm-Gg: AYBFou0eeaQcmNpdDqteGrs/a0RjqP2VWVGjy5r8678qnPQrNHK4UwoFpJiSspX853t
	30VUsQVrnyvM3Ux/nJ3En7HvusBDdwjBHpR+TBw362gDVOL/TETBe/xfqbX7+8ypauSW8jQUGG2
	M4TdlMgdha9deuQWYNus9YFM80oyYDjiaAhCwbWjyZ8m3qVOiHyj4iJ5O9z3v8RfYik2Ua67eiz
	sw+MD7EJP42oouvZ8Qtlyl/qOrJ2KkYNkiCKCuYuaE4TllzZz9jM4uk9R+KCLFj24oMXL0/MOr7
	fdGUYrjafR/HYx7PYdeCdNsfHxVwDVtAFdexKv9MPAMgIZyamREzIPPIzLb9/MjIxl5VtgZbChM
	auQ7FzZGfbNPNqGOfHYGQLA==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr162052885a.5.1792157879892;
        Fri, 16 Oct 2026 06:37:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr162048185a.5.1792157879272;
        Fri, 16 Oct 2026 06:37:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c633asm894616a12.16.2026.10.16.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:37:57 -0700 (PDT)
Message-ID: <20fa5e7d-89f2-4c72-be6e-2b6a802d2530@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:37:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX2ZtdKCk5RODV
 a3nbah35reMWBVNQRXJwdTyVLBuJ53PVPm+CMSR19z7ebtI0Og8usfueRXuAcUg2/WYrYBUFONI
 Tw0culNHFWY8jOKajk8v5T8ZSrxT0yg=
X-Proofpoint-ORIG-GUID: _Q534IIYbjVGp8ppOdc588hIwS0_3A7c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfXwwgKgew2oko1
 L7EyNeLvkta/hbOrK0QUvm/N6wnXF10iD/ttCbTnrguHTiLuzI0xmqhE2A4SD22Luk0Oe/FNaI/
 yCa5OzV9sDIy41DwuQa6NSFKQU+qf2wh73lkTVfCu6k7RuHszhho7iCOoGcSwLIsBUkO/DL2Duw
 euztJgStXtVkFS9uukJHKiQE9AB5kl+c7p49EyCLaZzZVPl+66Hf1vmIAZiqLhG29Cc1xBZgMu3
 X8aD1VHzJI4Hlg3NE8JcOYMV1zxmHKib/3gBWFB/fN/ye9GPbaXF2LQBAaaR6/fBmncD8Ad/JCM
 eNaMHlt1+MM+81Hw4iTSdHEiBwMl1Y8TO0O/klC6iPUu6Y8r9I8P5reaz0Jm/9w12vlJxGtUADn
 b1gRgcUJCVmgr0VYG2MDzJ92vwB+EUuRsH5ToxVsWs5yxzBvyiEg81Y31bhzMLIqWkzwycSBnAX
 Q00VDVdNpxzaNtuzf8Q==
X-Proofpoint-GUID: _Q534IIYbjVGp8ppOdc588hIwS0_3A7c
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad228b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=erN5cKggTshIPlD3kWUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 10/15/26 3:35 PM, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

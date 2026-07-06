Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E93BCD2A
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326400; cv=none; b=hLVPufEOREA2k3Uw+D6wdiCH5R+aFB+Fe4AIhGGBtg9R1cKyRQamZpOGXHu+8SwdLoLngx+9jOuwglnsNAk1O144QhCrgymifDfrT2MHiibeaUExeUmqV9xTk0opJJnQq3xgapWHmgZMgEvTMyLkEK92+UqrsZVDFt56hKdrMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326400; c=relaxed/simple;
	bh=wtxOs2/90WBlsb3nPPFqZvt6qpQNNMJifVvIpUU180Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ByQHbEi+kisj0A2Kuk/+iEfgarRF8kTIrViOoAQ0cElOsXwFSEFle+6/itRRdDWgvN5eyMssG8pynl4GqdMxzFx+auWNfJIETBxJ+koo10qbVKq/ePYUWBZbhwiEBCyZh/Swq/0NZmW3bUBUJbtbeokgq76rKtx90TgFhifIHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncLmB1eW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnowMliE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncLmB1eW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnowMliE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N2UV4072465
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 08:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvxNtxEhEpod2tx7DjIirhJPaXps4E5xfm2RiC+2jHc=; b=ncLmB1eWjxzrbOW4
	EY3qmkcx8P9E44U9NAzp8bAHsi7IFYT/q82bfGo8DH41zSi9B0c3pYYMuGEQwnBM
	iNqxwEz3huNNWqvWmrhHlXDTCjK6LXPlTowhtNJRPv9gOtLAvrAz3ZDWM/cFG3Mh
	uaDNXfux4asLFjUdIg4wy/i1c8xSgEd5lmcOKjRslqiSNsKNWGhXc/M9CI7PPbyO
	DZOKut7XqVeTiqxLQVnyxw/Eh2tlQKhMbGk4HKQtCtpuONP4Vezgka0zVoEqmAvQ
	ItccTuzklTmZU6JqHtqPIkUsOJzYGaroq1knJkeV+nwbxnHO7AF2dldpo1dPycN0
	oSQZBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t880f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:26:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so6806881cf.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 01:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326385; x=1783931185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvxNtxEhEpod2tx7DjIirhJPaXps4E5xfm2RiC+2jHc=;
        b=WnowMliER8G46NWwgWjbgyG0x/pUwOBexjGUdMSStDrHiSEe3q0e/GEcshkR3wPcoq
         Jtz7aGXxCRBpU8wNtvxxg8jwKVLsNSRQ390LN6B1SPjgDA9AIJUQi3B+/9nAqBz4itHE
         D8MuuVDnPl7eepmjI07e5jQx8q7foMRtkVU3Rz51nOkYkD1xxuaMjmHFs3i4th9w75fp
         M0GbzitcyD6q8SUbJbcnaqD/UxOT16PeXeUCldZz2SJryMYW4mVX20kAXORhnW0SjUA5
         ViWURppmiqdDtoWG9Vx8h39OfTx6TnkW+T5AJBKGOFoGA3oUdJFcIRnIp1rH9DSYgNI/
         XsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326385; x=1783931185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvxNtxEhEpod2tx7DjIirhJPaXps4E5xfm2RiC+2jHc=;
        b=BqS9UoRKDrSGFFXQrXLsk10vIMFLkT/KbpwnfvwYol1kXrR6zIbmx0M52pogshsx0b
         ttDDr35XYvukcai9aQnsdKbWzIOF4POLH/TbZzk6P43TTMN2fAxdeJR8aTt4tD5wUclV
         rR8IKgY+4X1XEH795auVvzE8CXkhAXYIuKp9hDQHHZoc2NelbJ0I7Gcxhgikm1WHaTaa
         cB9BGN962AqLFWYA6SnWYUuC8u8gQesBgMq97a+/wQBt1/VZFwsecJeP/ZrAuTc3DwZi
         NnWG+V5wzhcU9ZedwvyInIhXeYyziKOwC73UixAIBjBn4WObpupuW/i4xcXxQ3Edo6yC
         bluA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3yMCMifhHOPzc8OYnXU0zLxuQ7+DeUeeYEC+2kVJ+SZaiFkj6FNlEvEsdFhZLK/6Jl+qxwgBQYSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCGNRJOZodkLfdzy2a0Yq8sdA59cOWXGOJgXj0TO+uAF/56WK
	BZ/Z2b0v9dk/2l7qZMXipBBwJdjnJIwQmyyqTZkhdMj7dloRSK25z36wZZOoXiiTC6T5LwUSCK1
	TEc8A7qK1KVTa6h4U0dYMBhqK5BrJlUCWk+gyUnS4QJXrcMADFl2smYtBnclXBvg=
X-Gm-Gg: AfdE7cmPfwDedraVJMtA5gEdJ/zNCBLPXJ/SC/HR7n0WCFVo27nGsNdmRGT4OfRkRaR
	zzaNa/MJBvY/ss3ieXjhavngMrV9TlFV0WiqZM7WoXhLhyLJI28al+yru7MMMPdCWGCielgT5QM
	OL6Wof5fAW1qi4NYqOp0Uo4tLAJ45yNVJCh/sNk4qOKwQaQ3i0RUOh93lbD/hsKJwKQP9jfFT/A
	OVwt7pthSIJbV5CI1X2QqnVla31KPh7JnsdraqtEEcHjht6dV/I/k4I4Fu3NLbyEIqrlfhGwsQK
	lJZOsaqKhBMDmC5Ucq08q18/Ep3nsu3GBrPL0svQrCsLa+i8PuBJz/VT4ok7QN19jp9N/X2GdTC
	O8/ypnU+2nB7YjYEd6vC7yBej6+9F1Y0ZTec=
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr47485441cf.6.1783326385059;
        Mon, 06 Jul 2026 01:26:25 -0700 (PDT)
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr47485291cf.6.1783326384685;
        Mon, 06 Jul 2026 01:26:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9d1c7sm3532949a12.20.2026.07.06.01.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:26:23 -0700 (PDT)
Message-ID: <e8e132b2-61c2-4e2a-b422-48230e6dde67@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX6oDYvOGbEmC8
 PaBaV3TZ/scqD0Cl9PObuori3us5oKrmmjak71PgDDeFxTyVcA/8iuVP0N0XfjYEtB0oUFrtrm5
 B/OGghkVnPHjkZCGLX+JTSUqujK3VHk=
X-Proofpoint-GUID: vC5QuXFa2il6XPLWSfq-Np6-F5nwMhl7
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b66b1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7LSsG2loEpG2YXDPbGQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vC5QuXFa2il6XPLWSfq-Np6-F5nwMhl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX58aVdYAN9Cko
 UuQlluXj/xIo1i+d7pNYmFFV95nj7zkpy8kEWqwotQVu+7OFDHwGMOFrmPAH4xNv0Gl4U4cGzU2
 Yf6nLRq6LbkeWiUjWRqTlVbTQIPvNWmhu6aItAaufH2nXe9cIxdbbY8DmlGybRDKNaDDMm3xw7y
 rZ0BL45fnRHAkL5oJFbR7pCm3yK5xT0iRM7ypx/xYnnVixJG9c6nua14ObEM5MpVYje4qWohlbp
 FlQaOtg865knWz/Fzyu9+lvSwW2EkGebovlaHDTrOsZwL/gG2szmWMXgj9apV/MtjtZCyQVpNH6
 fu58uq2n/MLn+mRdD7setsCLs2XLCPURrteOd7gw3gFgyMUJFsfCy0oKFleGdoat2gCo4s8Zk8X
 fKbg03X040Rk8+vHF8+J/RNTQPlV5Pj1EF/OlFgBJU+ZYHndBHVcTpmhcF+8mjasIX5xfZnmwae
 rALfatmazxul5XP97Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

On 7/5/26 7:18 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_desc', 'struct qcom_cc_driver_data' and
> array 'xxx_critical_cbcrs' are already treated by common.c code as
> pointers to const, so constify few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

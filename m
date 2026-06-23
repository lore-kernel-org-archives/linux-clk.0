Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9323C73CC
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207840; cv=none; b=lJOi7ohVMy1MqLlSyvs/vDZKcbRvHppL+Ly/VMQjuQXSGFMJqikx0dJPoyuvUKHc2+QU0RiIR2t4CBnaqdext7SCNR3Tu2y9jEP64KuWs97WBzz1ZW8PiFgk9P1Eih2ZfYNTVtpG9ypk8H9c3j1QHJMx2HbVtEJb4J+8yoh9W+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207840; c=relaxed/simple;
	bh=IOBuSq9oFvtUO9jbGRB2Dd8enVgsrDIh743csuSYkr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n8x9nfyyoyLm0FhEp1wdcu+cSI9v1LxcnPxSHjRH6NZoilL0NxbcTWv8jLLu8LftH0EmyS+o6FhkIDfyPYGLse533kvWxJGsyyOIvy+6KSrCegupankFB6yWUc5h1U0JrBqzsO4+oJejydl9d48cDIkbfJ/gt9zjP4P4hPzBVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddfRBVtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZkdQMlL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddfRBVtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZkdQMlL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7jFO31778225
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxrcxhyOuxd7GXZ23mY/VgyhqDmV2bO3uTTZnHP+KCc=; b=ddfRBVtWD6GZx5zA
	yAjlwzGMS8LestoOxc/dFUOEJUOxVi4imsislr0aW02QqDKKDUEUFgNTUCdxnqnO
	wYndztjTmtj0mHt+5WUXaBKx+rfqX6DZbWcHdkL0wt51Y+Plf+c4Rg9QnEqy/HvS
	EadVVykoRL4oNMihGQTIiTFEFZEQLPpXywF69ehEA9aAlKY3y3cxqSOM55IxSpSd
	or+NDZDCtSO7A4hyk3m/L53wy4dcqxeC4hqp5Vvtf5JorWdHeU0V3lTowRc3MR9o
	tFzDLZVoYrZqUyr3i7tJIbKKLyV235zG8lmfbHqoNx6EhkwD1nnjak6O7QZPoPkD
	MDkg8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grgec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:43:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ac43d27so2541551cf.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207836; x=1782812636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxrcxhyOuxd7GXZ23mY/VgyhqDmV2bO3uTTZnHP+KCc=;
        b=OZkdQMlLCwbarJVpGk8xUHs+2ny+szusxULGfjg6Ww/od5WEAm88c50EC4LI22LaOk
         d5y/IgjKbIjhaXyDSbrYWOq/NF4w8EdRKJH5QVm5/ndMuM3J9MS6+9lXNazk8WJMMyYo
         25A5JrS8XWKK83OoJ/pgo3ze9Bandsq37ofncsqjgpbJM9uWbiV18sPz2h5lgT1wongV
         Fdeg4761371Ngjj9geE4+gS87yg8N4MT0XYiESabZlqqWNp38e4yo8KXnvig1Oh0xzNQ
         uslJh3WATQibC6QWYZLL6k4YuCvrdAYkrzl5iXeAdM5ztqywjRwLQTa8taUi0WSgTf7j
         YCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207836; x=1782812636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxrcxhyOuxd7GXZ23mY/VgyhqDmV2bO3uTTZnHP+KCc=;
        b=rAHWBgWs/zJdwS4JbQ130ny4TcAUuzo0kHfQxAqol8Z5cUvHTVogGyDNVOhuVWGQGl
         j1rp9Xk8Qz5KjfThNKg3zUnbaK6aNGQGW8WU3oDW6ESFTKHqo4YFPfrxYpj2JOTeBt4k
         RFGIEvajQxQR6mk6Hj4gkiM8BV+MX0RDlOF60Fkp4wzLpcdN3hPjMy63vIfJk0zWxUS1
         xMWrQsm6kwtmaVxvTXxHJphBkk03QBhG+61R9rIKkc8hb+v2r7L1vVFgsuOW8gOa2XQz
         6qLdb+2bFs7SJ51yg70YeeYMJ2WNkEX1zVhJPNHNlc89VL+i6ILbDCy3Jr5FZnaonrtL
         9IXw==
X-Forwarded-Encrypted: i=1; AFNElJ+/gZrEBswIeacmlAbxHuuf4HCKm1Wmn9TsqM3sAsQoGq6FPrQ1WV1TF2zgeqZI3sbbgk1ULXQ5uO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ePsEl+/0a9HoG6EXW59DZ2grQdrvL7PF92vsLIgZnt31qL3P
	aak4d7SwVX5G4gSO/0oGczcefUFrMmUivHI/77ION9OUSWIiDnM0sMrr/JW9/zuQhfUcZo3vLIt
	7j0RJbTbfWlTbk1I0L36isSJZQF+J06sqoi0JDMxJuPAw/DfDklb5R88mIS3XN/w=
X-Gm-Gg: AfdE7cko15uGRd9v0gFdIycao4XqF/ixqj/Lo7kWrdHSoChtcWiUUXTXfeUDprHnp/g
	73iJTiooYr//jtwuUHldGEuuZKuYPxOrv+4A4qN/hb0yuHQxq5QRUs/Uxo0xRA6LjvKqGObWvON
	jTYzL3X1dMj1SnToDU6XMHyVwPRYEp3/FG1VhmCAAgnmMC67+vfUJz4p3x+GifHT4Pej072vlal
	I5Zdl/hXqf95DLY2ud73P54GtRjvxVvqJCblCTk6jyl6C/1PQG4rdikLnKFiFJTJHMottReURHE
	u5ZvfHmBVsWvuvpawchGyAXD5egoVRzr1db/1yeKMoppn7SwpPxwUWFqkUPE3MYprTve9ATelll
	3jzsTs2UWX3g8exrqGWaEV4qrFEZxt/EHKvY=
X-Received: by 2002:ac8:5dd4:0:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-519feded2ffmr149495111cf.4.1782207836464;
        Tue, 23 Jun 2026 02:43:56 -0700 (PDT)
X-Received: by 2002:ac8:5dd4:0:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-519feded2ffmr149494911cf.4.1782207836017;
        Tue, 23 Jun 2026 02:43:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be32083sm4445915a12.14.2026.06.23.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:43:54 -0700 (PDT)
Message-ID: <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Antony Kurniawan Soemardi <linux@smankusors.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g8yWLLHcMTDvhX49iZoTmQPDM4Zk0CyO
X-Proofpoint-GUID: g8yWLLHcMTDvhX49iZoTmQPDM4Zk0CyO
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a555d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P2uxe-tILJFHe8phFHYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX8qTclura20Qb
 etM20SxsPVqO6O3jV7RdNuWqk4fEno1LmnZXY8DyID2FB2lhKl+vT5FO3vjd5Or5lhTNvP+zRVM
 NqDAe5j2TO8ODDPBfRoD7bu0KbQjPSc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfXzOE7b72rn2Ow
 tpXI7qsd/tfJRFrtAV0RzI+UJMP59AUkI5KeqZqINMk2Pq0DnaBZZNTRsAc0UguJU3GNZq+5KLj
 O3k+mff2Lxw7Y9kXQdIIeBuLcvoSJ+9rTYigRPQgBMXy/lHuguqoFiZBUcTI9LXG35HsaK1X+gh
 GAPwsqviBgij4NNJBL0ZYTcRjmafI9G077BnyLF/Qnkne2S2K2MR7Sb8UdHibsfecrIBKAD9AmF
 2123WcYlUm73w4ibCC5WpljIPzfPjoFwec27KAjmjw47WMyCZNhcy0O/WhTWUmUL+oRJF4R42KT
 3Bthsvqr+ILRiSg6DNrcYD/3dh42JnvarhtWMR+mcYudnTnC4/jsb2KekV0JJz2i9kZwq1iin2j
 VwLj9mWhG/FvYui/fkyrXLBWM4xCEQnSFIHskbtgCB+IDOQYw0wGh31c7ICGCSjDnNJg3cePVK6
 xMtPh/OfiE5h67jfl2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230078

On 6/23/26 8:05 AM, Pengpeng Hou wrote:
> The HFPLL enable helper waits for the lock bit but ignores the
> regmap_read_poll_timeout() result. The polling condition is also
> inconsistent with clk_hfpll_init(), which treats the lock bit being set
> as the locked state.
> 
> Wait for the lock bit to become set, return timeout errors from the
> helper, and propagate those errors through clk_hfpll_enable() and
> clk_hfpll_set_rate() instead of enabling the output unconditionally.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

This looks good on the surface.. 

+Herman, Anthony, Dmitry could you please give this a spin on 8x60?

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFE84C9E1A
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404057; cv=none; b=SF98joQagBklZ1GJr7sjjUZq6+DUOOBA8xI63bcGPMzTaSU6klujQk2bBdytQL6BjEu6rSOG7Hjypd6Cf9Wc1PJE1/fA6ZbGl2PvqTgAxT/18VrJVPYHdwKFLkNUU5AH5ABgWu4C3Or5Ps0AQSqmHjeiRMZFheC05ANEbmAKXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404057; c=relaxed/simple;
	bh=R70oW8LwphJ/NTsHnZ5ZKcGx+X10RwjkMGHl54tVw0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOeO2LXqsSL/kBJ+YNnXE6q9FdhkUCpNSOp2c0qA4cX5emxlxih77YCGX5O7c+ZqDVUdsiZVRblbmbkHtmlhUXomkhUsbjuQLlbCnY9Re4mzZzjpSadcN9XxSKEKp/t5GGaUNILPOzjV9330Kmu3DelwJagBI67b8kgDlK++6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGh/M4oI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgxYH0uK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGh/M4oI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgxYH0uK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YmAj2688810
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=; b=MGh/M4oIvCZ0mjOk
	TfZSJb3b4L/Su0I113ZdT499+I57TqD/QGvNtLzYywPwHc7zsBDRrj4KlRt6JOV/
	sIec8yTHi7DrZdGUpq2mBKPFdQN53ASkWeUuWM6/WR6A84ttl3d1Z4w47+BC2oIO
	2e1fNPD16VAAYN7I70WXXMgaV1OqtGZYDk2G74d4uoAbyJNrdxpePhCnHaTZvoRm
	L8AiPFy/by5pgDPtDaOoVvTeD6QLKs3LnTszOiK96521Bf9A2DFfleLOO8NX5MEz
	QPnfblTJcfyLzxFWy6j/wQGYxTGhy0gMRH7ipiWI4X4nXfPA2Rtqjqw58mge/AUb
	UaGHOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0aqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 10:00:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so78651685a.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792404052; x=1793008852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=;
        b=YgxYH0uKlhGq3eNXKSbl2rbDDt9T1d77mGgaiPocLBQSghnYxSqzRdCc1/ZZESb5er
         t1TNrK2uBov/wibDL6nK81GuThNPJGuX9rfTa4AX4S6ks6ivMBYOSYHka8bzlbK/u/VG
         CS7xq7r7txFcJBLYuyocpoDVAVgqRVlVzxDkwC4Z5WiSc7QrDe4XMz9PiipArJpFVpxn
         pd1r10JidI6Qn+fjdyS7bjg4xHQ5KsKebSxdmYXdvwH6R+mir6MVn3du7D97dKhtsHkr
         hFNUr1049ZiHSgGdGkE+jdW0Zyn5A76SQvH8lTYGiVghB1moCvWRjd7O21eaX0lC2t9I
         4F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404052; x=1793008852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=;
        b=XNvRRKE6aUwrxF2AatGOKECxolf255SRj52qbenPM2pzu2BnR0KrNmQnYpl2ltX0YT
         RZ2Oa+UPrnH2caXRYplKLvxuF+N5MSpQe6Ut5tprs0rqfdQCeFiWhg0ajTahSrqAtgfo
         FOgUDHsV9BXzJxAAqq268nfbw1sLN84zRClu3pUcN7b7TspV0LwuBVigWfUJNdSIj3ZU
         l9tMFXGuP0lRK1FdDJi4l0k6sK2rizJAY30TxL2IicMM5nRJtJcI993zlMfFgyPC0Ivm
         VHRMzffEfCgWXrghZ6R8Is6ra+3+YlXNYUwWic/z5M/jOtupIBoju0NYV5m9DJz2Ad9Y
         0ZXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn42ODhB4Vptl1Hzg6umzizHudJ6cqachPKu4kyiwP9yzyKvQql8OTznFIKo+C4z2eEfUxhmxqv7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhjKP7hUneyqt/C+t766Sjl4H0X7BNhx2nGvrYDxt26HhF+SVM
	DqUH/tfoN7ZMi4PNEcEZU58LKqtpAoDSJ9AxBBstsonrXjY75RW8B5viMrpWuo82dy7S/XSUMqo
	/7CwXLF4QqJXC+6WWcpssslxVqGaUDkxMUNs1HAgVBWLuEfHIK7u7sF6jB/VZMnk=
X-Gm-Gg: AYBFou13N4gRhRYpKuamz9DiMePcWlU6TSeplAdbnZpYGyGQpw+xKM9HgJ4Pi1j64B6
	DJiLqx43hz0V1AGyFmbT+6L2pjEPoDI9iciIfGALtXZz/zDuL2+cEJqoKtWUDoIdMGB8IXXci0J
	ppnjRAmCJM8z0g+4WQxXlWSXkbXkMTNr7Zb2upIVrwXIIu4QhI1BOThC2Auv0RNrMh07GH9A3bp
	dR6TAotMakchc464HKP+1VQveyCS3ABU2+kBsaCOX7gVdp7eEd0pe1il/Pgh5unscxbqmF2rmd/
	kJ92RYEOULo1Daa9RT/kbirgPjB3u0AI9rYDR1ueCn9sLCs5s0qVrQfRhSENikN1Wm5OhsbHBdb
	+mkoSyIwT+Nmg6foU7j1uCA==
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1435655485a.1.1792404046763;
        Mon, 19 Oct 2026 03:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1435619285a.1.1792404044185;
        Mon, 19 Oct 2026 03:00:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm3556395a12.24.2026.10.19.03.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:00:41 -0700 (PDT)
Message-ID: <226826ef-0cf2-4147-9256-d257c8272883@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOSBTYWx0ZWRfX5kXhbFsy/OSP
 NvcOcXAJVacp16oT+zavqCfJuZRsBVIRhK6+BTCUOkAgu4FKXN3S2HjBksnn6IdTfpAkdVzntNn
 UEdfrYw9k6TfUkxeZJffwrkBJqx/KwY=
X-Proofpoint-GUID: s2WywAb0kbvIPjv1WxsI-lqHkDAFhfwW
X-Proofpoint-ORIG-GUID: s2WywAb0kbvIPjv1WxsI-lqHkDAFhfwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOSBTYWx0ZWRfX2allXkbyVIal
 ILtpg3Y6c/0TcR+bw8ZORXLG+6EAqI9hMjPoTYZvWIyY2dTxbldVSY8cJcXVY02wsNpDboEIH8r
 1XJ2fTcMPqIqgpl4wVFVQLAak8Nf9QueuJ3q6oP/Gl12uILkzrw7FYhKUxgGFFh5QaO69NOH4Al
 puSujr/hKoLA5qwUH3LwMaORIEXVATgY4t88AJ1USc4tWpuAxFlDtoR0FuY4q9HDdbdG8ouQrzP
 IsiJAroarFJ4KNzy2DkhsAfxu6GzCitBSskbK7tbvvHdi/aILylOKjWW746SZRlVC1hAj3PZRwT
 EfMf86wX3IddSMEaTcn7YFF/+cohiu9cYRKmTIwjm04eUiTryZMtZvXogDgL/BAVyqCzizEF439
 uKXac8VvBGA/XakAn4SqK5Z0bi7pgSiuytUJWfV58b5kr0KEKG+VlanHi8KtZwZ7PaijdrkusW7
 6cZoA96fqCHIn/CzuSA==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5ea54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=r3KDiPLWR5a1ZHJE9ToA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190039

On 10/16/26 11:12 AM, Imran Shaik wrote:
> Add support for 10kHz and 100kHz GCC GP clock frequencies required for
> display backlight PWM functionality on Qualcomm QCS615 (Talos) SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

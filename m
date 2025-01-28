Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB019F438
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063601; cv=none; b=PC3FntPsC5YepoVdDb71H7O0oSTKdQnBnUrP4W0mu6URkwrFKXxwRFroZMKbjyuCXBt6cAUr1Q+7W8+0o2LilZvbR7GSrhx4NZngARn832JII4dyrHPuBOh1+sivp1owYZdUlGo7tlKs7v9OslxLnuGY23XJt+o8fjGTz4oOuX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063601; c=relaxed/simple;
	bh=dOoN1H6FsfncEe5JvH+mItBiiJZFYhO8jumBlOj6SLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jC+Imr0gTyz/NJLU48VSgwmqfgYh8HAlisyWB7n34SnxvNl44IXZAoisZo/JfgPFf8nFriBFnb2SXkc8eryUWJxo5MfgJ7IGB4P6nJTFSCvcmgKMlrv1hIKIemNMtC/SihwqCAMUNC5hWVnbevpPvcq+nifSWuxJTB0UvOzSa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SP9Eta+n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SP9Eta+n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8hdjB015113
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+S/4n15YF+vLVuteKg1xzKfW19B0jPDHe/Ppx9S+E6g=; b=SP9Eta+nduAfb70T
	bkiYWR3DjAY/2PKn6/9bReWzakawRinrwcjojb19vlx59DhVqh4X5TeAdn/DZ3e9
	Li4WjwytudG2WpXi+kTvIO2Fqzn4ngrqKaYfcFJ4qjkA3IRi3XaCWVS37y2/SDCU
	jn/U2gYVMYByDJLA4y5NU4dGN+RGzUWYDS39H72TwLNra5GISyDyGSi7LPWM+xGd
	vjunKOrjI5R9GnZb/rxPi1r5MGA8l0u/m+qIxTfLDGmkzcUkSY/AcAdWFlAhPc7h
	sF2/aLDxXbiOxsgHnN30bh/8kvhWbSIzAXLucdZgMDM2rvAiCGW/0aUJHOdzz1XO
	mofd7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44euyq8bxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:26:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6fec2de27so120933985a.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 03:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063596; x=1738668396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+S/4n15YF+vLVuteKg1xzKfW19B0jPDHe/Ppx9S+E6g=;
        b=uw6ZJs9vTURKwO31ogF1bGHqTCh0h6Q9DmZfJof7sxt+apebK4XSkxFTwRyc84NH6z
         l8MmJRfADjUdPh0j8ynkjzGtMQM9EcDNOINE16TgkjhRjzl5oY2a2gqZzRHKrUSBhxyQ
         m5UyErgvIsWZoOrCk2i4pB7bAPGEyCcYeEmtohDtVrl50dSNmfr4NS6QLIQN1ovWjev5
         W5ueaTl1PdxH7xWo89rQ6uwZluOA/5u2ipA5VSRX95MumdrRxFUoAAKxskKlbK/PsdnA
         eMneirYh2fwEzQv4RMEqcm0Z+Dy9XbifCERThbjiTLcGNECwDiKvYLmq+xYrzr7cNRq5
         /Q+g==
X-Forwarded-Encrypted: i=1; AJvYcCXuKu/YXSPm2Ho6G1+ZvUSwBxc17H8iiHoJH0ggwEIuSfIyOviOEX9BjHGoSgutx8TcqeNzfIAoNOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuWfNRWkfhv21yNN+Xe5K27ccEC7gJt3xIaixE/wBpY6aH405
	MMWn2Tcf6kFyRlpCEYvxpmyHHf+nmMj2CfzQX0tTM2Zgb5DS7SWcCLe89yo+kHwnxd9sfpHxqH9
	8HUB5OFrnWtlsGWBh/+Se8RYfHg94gtrZmQJxrNS5yy3vwMGobZV2omWnLXA=
X-Gm-Gg: ASbGncu32RUIwtytT3CjYforVwsGImhBtjYz7SebbyOjncOTNnfWnunmA8EeKttvVs+
	griBYr5Ys5ZqZEY3+hiWYK8XQ69z7PPZGNj8OnUyttVMSapIRr1pRdVez7sNPfxqDEfcUnsnRyo
	Is+8KNYVa79KOIFSASY72kqdS+wANZ3RBgftVjgT5y8HimiNoJh05ekg1r9jvq6QX99VtIwiOxc
	liWBV2szOkjPrE3AogZPUnnkFklRh2L2E0QHP0L46foJPdNXIoM9tzkrE/SSzaWvQPSsDzNO0S3
	K0MzppHaKhixsl61MeLYiFC6Bl8qbBPqElsxMkXeJcad14haUNskLko2sBw=
X-Received: by 2002:a05:620a:424f:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7be631d330bmr2710922085a.2.1738063596560;
        Tue, 28 Jan 2025 03:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIC9noFjSJ2CvWjxQive9gz7MmGb2ik624YqYy8TWgSNgPIPR/3aCC0pmxzOUK4QB9uZbSKQ==
X-Received: by 2002:a05:620a:424f:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7be631d330bmr2710919385a.2.1738063596173;
        Tue, 28 Jan 2025 03:26:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676116951sm752369466b.169.2025.01.28.03.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:26:35 -0800 (PST)
Message-ID: <56dfc864-9a7e-4954-a7f6-91ff6b6d05ec@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: update interconnect cells for
 ipq5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250125035920.2651972-1-quic_mmanikan@quicinc.com>
 <20250125035920.2651972-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250125035920.2651972-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QvwuhxOlKSRMaqbVG06JIQ-zNq4BMiJf
X-Proofpoint-GUID: QvwuhxOlKSRMaqbVG06JIQ-zNq4BMiJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280088

On 25.01.2025 4:59 AM, Manikanta Mylavarapu wrote:
> Interconnect cells differ between the IPQ5332 and IPQ5424.
> Therefore, update the interconnect cells according to the SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,ipq5332-gcc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> index 1230183fc0a9..fac7922d2473 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> @@ -35,8 +35,6 @@ properties:
>        - description: PCIE 2-lane PHY3 pipe clock source
>  
>    '#power-domain-cells': false
> -  '#interconnect-cells':
> -    const: 1
>  
>  required:
>    - compatible
> @@ -54,6 +52,9 @@ allOf:
>          clocks:
>            maxItems: 5
>  
> +        '#interconnect-cells':
> +          const: 1
> +
>    - if:
>        properties:
>          compatible:
> @@ -65,6 +66,9 @@ allOf:
>            minItems: 7
>            maxItems: 7
>  
> +        '#interconnect-cells':
> +          const: 2

Please apply some criticism to the review comments you receive.. this only
makes sense for platforms using icc-rpm or icc-rpmh.

Since this driver registers an interconnect provider through icc_clk APIs,
it explicitly uses a simple, onecell translation function to .get the nodes

Please drop this patch

Konrad

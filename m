Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559E1342510
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813116; cv=none; b=jaymchKyBedA89/F5JVSE6kP05FYNWqkNrioQbx8TcAXnlf34LGn3kMUE/zy7UyvvGnK+SNiziv10sffpLbmkhQOg4D1tHrrHsZMaEQF8I1BhTeKErECiENuCgwZGM49MkeWlOXFBb6lTFqVCbrlFHnoQl1o+TLh8zOZrhzDnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813116; c=relaxed/simple;
	bh=sheGxm7ioYDIFzYQgZPgzTJJEiICJbj+IYtCd9XLyl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI2GHkBQ1KFxtpOQtNRceaf8fuR+HBJKp8MAOVerKyh99arq11ylEf9XBN7lbeFXxbGZU2pIe6vVfac3B1ohJmBhW6j9LLdDTJRAyyn5rhPtVmMhh+bqdTSNj8AmsVx0pA6ANSZlKAzewmsNf/If2ym7rWeC50Gg/e2aIK5o7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a509YB39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqXM6RXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a509YB39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqXM6RXC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6m6KF1433247
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 09:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=; b=a509YB39uX5tBQyI
	MjdoU+aJR0HNKGwFxdLofDnW3SsFSU24zL9ESi4TehUi3fyuVpBvH9sPzuSjd21Z
	WPArMGUJfTGQTvyxzHZZetdoNiDcRYooORs9IyzieI7ZvZmPk23l3yitHyphFSgy
	WMBGL8Kf30ex3bNoL5zmkOCAP4/mNOPk2X1FPDZdZe6slBVeW4vAdmf2yVlIR3k/
	vWGH1o1WA862w0rHTZDEhhvQCslSWgNj8fxLJeSgKgkDT1jVAJY2MmV6i9Ce3ScD
	HJgUgjdLvSmgnZbQC4ofa2fNmSp4vF39don63K1KqiNPjrXzG4mWuqqd7Jy/8muu
	tFQ/Pw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfbmru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 09:25:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so1076204a12.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813112; x=1776417912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
        b=fqXM6RXCjJDCJ4YJt2uhaGZyCJmIyBcZfD/Iokps+/8bexdiDzIzeYyUY+PawoA3MG
         7GTVYDqT2eaxcL8+e80xVdqmUc8clRP35S1erPxNFGtTjYfcAUdfFDkXXXGrOcthSVue
         6qe0yHlLU+rhNE3r95JM+V74QW9w5sEyd5/309foaqgfR0S3ti91WO4F7AiGEZ0T1pYY
         kMmaSL4DCdVuTAbwt8f0ckq9cfOpff1i550XfR0I9SpYVX2V0JDEEhDqytHf7bUsjYSk
         EYy0ngBWlnZyGlfGMl+wQxiq8xhnz6v/pqeOjibpy7IXsGAp4HbsFDqbs0x6LD/SHXZ+
         hnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813112; x=1776417912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
        b=FSSZw4Q5W5MAdRibhKHribfwWXax6+TfCkWqz0fyozPaMs42ilRW5Qa1yRbrvoT2jo
         iwNMIwchEScTwAbwoaPyOfDfC0voxPOiDceLJLaB0reGOizQhB+Ph75VZw1RWpzuqHtH
         EAU0DY2WV9xhPTPRyDYPBJr+so/anQlBND5j8hANVcVji0wtdeTnhKbKdIUoLjv6V4N/
         +Ew0FmTFvrXLG3OTgFA+wDk37SDwLn1FPOIUpmOHYbMN/RVI427gCRV5IrphAlZAz5mq
         8gK28VF63kQPlgXSNyj+W6dceI3XkNBy68kF+5VcVbD/DDpKemwG2cWsK9Acr8KBqAbc
         aJOg==
X-Forwarded-Encrypted: i=1; AJvYcCWMRPyge1Nx1Dr/aSoqPT2gTQTyf9h7qfXl0LL/u7GMj0f68tQWvd5m0PYnfYl1oatChnWYY1efdS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ktXDWPGO+dVv8lhv8RzITiDQACw3y86yOr0m5Wp6jbc27K1C
	c4xUEHeFLyIOe1OSt5FYMZ6/3WRfgrNvl1m/k4YGXPn4Q9OY7nzsDAEAmnW8PYPSnp8prclQtK1
	69CaXqHpZwJ/9MI7AQj4292xlnLovDSrL50h9AKmNlF+ftlMKXxAX0PW+zTKdDHg=
X-Gm-Gg: AeBDietYEGU2OZlnzCncsyyb69s3EKtCaBon5KLojMm/jt54WFWmuDTK+b6B1SnDhk2
	gosCTDGELXVeReo7QaWPr1pnNlslpUFTgEWtJPrDrknzmr1aIPeW2cCQ9eS66P0M08nvWZurPqZ
	lM87RGlJxoXL96L6KDLsPJkJv1m6uLWlUakrsd36NY02uUaj2iIj33CnHHwMUSZtovr2YOpDyG2
	lZqvmlteKuy5VVnJ+Ue5Zav4hkYWuP+ZLKDFCLYg6lVXINwgIKKKiPUrSt8aD9DS8Rw+9e3yJUA
	gLSk/N30QjoSZG+l5E0vTCD7WnD0vvCPRUL9zXsU00c32Je/g0Kjb0+06Dr0J2DKp/kKQIbv20E
	snfX8WRyHUmehbcDV9qpzE5M15ZGuOGpRytlnEQMgl9PI1ckB
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr2705974b3a.15.1775813112204;
        Fri, 10 Apr 2026 02:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr2705947b3a.15.1775813111521;
        Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c506150sm2123732b3a.52.2026.04.10.02.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Message-ID: <80d60c30-7e60-4233-b072-3d3719533481@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:55:03 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8c1f9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MbdO6sGYhmOsAQUEtOMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4NyBTYWx0ZWRfX4J298vagZ0oi
 tE7GX5Kn1nEwnc1V6cl76mynnHOYYuPO2y3WVpHCY9PFlllyJdDMkCAvE4BPXJLvwwqGF/n5mOl
 KTFc8pg5ZqV2d1DGG3sYcr0BupbbkbFKJHYAIQxSM66bvwMY66iWRaln6a10eZJrrzwCjnHNL18
 FTerC9YXzZDTH26gNwHGXHpSU4joBF203inxWESuWnyPQswTN3k2KNbw0XG5wpAPRuyUFUVb+mH
 usiaSVZhOmp/ZlO1K5II/H+M8cfW0wq7Zs8hZU9uoF0iPJvziKMClHwnuVXNtMRPOI3Yr4zFDgZ
 BtcBRssMKokFw2PonLP7D7aVDz/wgeYvT60NUj67z3EJZXhJJUr8Woih3rfegrEGa6bPbdthWDk
 PeEAVCjUAGj6+k+r9vQMncnwMAG4hMQUX82sjEhfgPoxMiKjbS2w38TdBWfrRDqYrChUII7Zr6D
 SZhzAMXhCXou1hCdUQQ==
X-Proofpoint-ORIG-GUID: Q4690nLsN48x3sfKhof0ZxR4Nkx8wFok
X-Proofpoint-GUID: Q4690nLsN48x3sfKhof0ZxR4Nkx8wFok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100087



On 4/10/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
> 
> Note that this patch and drivers parches were likely not tested.
> 
> Please mark patches you wish others to test as RFT.
> 

Krzysztof, please find the logs, if you need the clk_summary I can add
those as well.


/ # dmesg
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd801]
[    0.000000] Linux version
7.0.0-rc7-next-20260408-00008-g476992104d28-dirty ()
(aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld
(GNU Binutils for Ubuntu) 2.38) #19 SMP PREEMPT Thu Apr  9 16:46:11
+0530 2026
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Qualcomm Technologies, Inc. Eliza MTP
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000894000 (options
'115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] OF: reserved mem: 0x0000000080000000..0x0000000080dfffff
(14336 KiB) nomap non-reusable gunyah-hyp@80000000
[    0.000000] OF: reserved mem: 0x0000000080e00000..0x0000000080e3ffff
(256 KiB) nomap non-reusable cpusys-vm-mem@80e00000
[    0.000000] OF: reserved mem: 0x0000000081200000..0x00000000813fffff
(2048 KiB) nomap non-reusable cpucp@81200000
[    0.000000] OF: reserved mem: 0x0000000081a00000..0x0000000081a3ffff
(256 KiB) nomap non-reusable xbl-dtlog@81a00000
[    0.000000] OF: reserved mem: 0x0000000081c00000..0x0000000081c5ffff
(384 KiB) nomap non-reusable aop-image@81c00000
[    0.000000] OF: reserved mem: 0x0000000081c60000..0x0000000081c7ffff
(128 KiB) nomap non-reusable aop-cmd-db@81c60000
[    0.000000] OF: reserved mem: 0x0000000081c80000..0x0000000081cf3fff
(464 KiB) nomap non-reusable aop-tme-uefi-merged@81c80000





-- 
Thanks,
Taniya Das


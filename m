Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2137B415
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477198; cv=none; b=P382g48d9hKmJrGI3WsTrVh68qbZG6XOBM472m/JF2/SEz4fZWqqEtw7G0xXy4+kUCQQU1RrXn1/8Ew1tOW1YTaFL2UCxSdz5c1iVU2oGpwwV3CldayoNgQGiNghdjiWmBjAwJODo5fj+ZPP5f3Npo6+drm3qPtID1oGc7VMJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477198; c=relaxed/simple;
	bh=z9tjCiDomJUS16kqSqnbRm4EHxgfQjNSyK2cJXYp/VA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YF4cxFfaxGyJ4cW6MDtq44D6V7dY1s6H3O5R0M/viGJFGeidBTrTKyDio2m4ML/uPoDM/aCb85rD2oDqoZR+TEvA7Bf/ZVJ2Sw6We5F+1rKJSSk/RTUNhg4QXaZhEosLXydTNWBvyAbEvVENhoE2BOwXk8vFeelG1/+EHb0IRV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MkIO8/Na; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MkIO8/Na"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-56db1b3626bso8182849e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477196; x=1778081996;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=;
        b=KN8c6VIDy8v+fjd4pSYBXkk4wQqeFO7zpUtGvzx5lXJ87Q4ucpugVYtOzeOCaATn0f
         3zRTjKi7vS9UK8Prc1go+QfG9nr/R5BXuLflqv6tP8wsjaMuYPsk9f14hHP23x9X8D72
         pfyUg95sFCc5bYo1mnpYN3nsCO4D70yM+PY/1OIv6gAH4KvuI8JuLsmS7O/Zo6pZQngE
         InE79DsZQ925F/mHbh7sRP7D8fJ11CqdddVdscttWeGxQteJvZtXHHVko6UAZDkrK9JP
         +3/SWqLY3+8+58UtSKcKcXO80LXGyRThmB2PFlNgCj01Y0FB2yS9cmaEvdO5uvoiV7d3
         KINA==
X-Forwarded-Encrypted: i=1; AFNElJ8YNNTNgTiMALUlrhdpVSnNy8P6fGbB3+cFRrV5GilFRZxX7TX7nles0CWIcaSI4ZsYvxOZb+fewDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywozn2AnxIUnfVMgjJYwlBDfckPJ+wAvjz7TbJqKKn6kUyy7W9m
	mZLcJOxGF4z83niuEBvrUayYNJqrNHXTuocduwsgWucCBS5b72Zl5j/fIKb22/4iK72ZJOhOz83
	v2HSzAkveiHZH1bjZeCkaRslPQr+5KSUX7GxOsN8DRm3/EY0O+e4QgVh2c9TlTBGn/xILNBQodr
	bIGreIlBflD/iz6FY9cK7VN17sDBNPmj41c3qrBcfyZ8Nc7xYrxazSdw9J9JTy5zQO3p7Kkt4fw
	+83UxLXb3LHLZA3xzm6
X-Gm-Gg: AeBDieshh5P3LNYFMqvpgyd5GbtftZ74t/rFc16sdAGLknNlYo9KZhLWygtbhdhqBg2
	Jv2LCiwRzT4aUk25AzPocO+fMBGNq8mYvwPYOzQYiaH9vUurGk65NlGzyTA+yeyqIwnDHUT2Cye
	P1JYYsOURqE2AOB+0zhMTtxos1PKbb0pVkJ0x4qk52uwkqIkCrVN9SJskKn4ojhHzSKp1+GTP5o
	BoyYgG3UbXajfu0GMBa5K3+6wsHzmWDx67xI2mOZqkiqOW6A2Gy1P+TOzRMohE8vODK2xD+Mv/7
	tf26UlRqW6VK6WF4je2TVDHI/OsaMDm/FnRvkNl2XG11fIc8FDViXVUWKux2ohqOBifDOrqp+7Y
	dDNASfcUvehYaMehuKswKC3mXigFyVB+mYGOYqR6vcbWJ7vGfF1RATYtG/SFHiIN0ykz2lQrjts
	NxyKKeqjhtf0JxfRchbCT8b7FIT15BTwFKTsyH7R7zuYHGdiIf6XhTcZKXlrwsuvb1bCquYPtNu
	4I=
X-Received: by 2002:a05:6122:1350:b0:567:44ba:bd8a with SMTP id 71dfb90a1353d-573a566c896mr5050485e0c.9.1777477196183;
        Wed, 29 Apr 2026 08:39:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-573b6ce36b4sm165289e0c.3.2026.04.29.08.39.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:39:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c6fc58aso20677327c88.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777477194; x=1778081994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dNID+xnAT4/eagYcPb2Np/6K90V+gH/f73uugiIiXTw=;
        b=MkIO8/NaEllsIa/cKn40SrRP1E/A3vFWkhhJyuZ27V90nA2y7tgiBMhANuNxxrJOUb
         R9nqFOhtedJ1qGANcP9KxXI/iqOAXf/rvmg/Vj+iwtwyz0IjFBGqBcAycfUN67QK1wzp
         1vUe0rwh18uORmNM2MVTjMaMr1H2gjIanygf4=
X-Forwarded-Encrypted: i=1; AFNElJ8P7tCPBx9OqLUTE3KVTqMZPp1/l7JFIe4XMXpJjAkt6ieLS4RnTlODBzwjBUM5lHG5J/ihGVNs+Pk=@vger.kernel.org
X-Received: by 2002:a05:7022:eacd:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12ddd9614a5mr3768780c88.15.1777477193981;
        Wed, 29 Apr 2026 08:39:53 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-12ddd9614a5mr3768748c88.15.1777477193388;
        Wed, 29 Apr 2026 08:39:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de3216e81sm3765626c88.4.2026.04.29.08.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:39:52 -0700 (PDT)
Message-ID: <25d267b9-7839-413a-ad91-9c6802bcf292@broadcom.com>
Date: Wed, 29 Apr 2026 08:39:51 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v3 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
References: <20260428201522.903875-1-cristian.marussi@arm.com>
Content-Language: en-US
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 4/28/2026 1:15 PM, Cristian Marussi wrote:
> Hi,
> 
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
> 
> This series aim at solving this in successive steps:
> 
>   - simplify and reduce to the minimum possible the rates data info exposed
>     to the SCMI driver by scmi_clock_info
>   - move away from static fixed allocation of per-clock rates arrays in
>     favour of a completely dynamic runtime allocation: just allocate what
>     is needed based on the effectively discovered
> 
> This is done in patches 2-6.
> 
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
> 
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
> 
> Patch 7-14 implement such optimization instead by:
> 
>   - reworking core SCMI iterators to support bound enumerations
>   - use such new bound iterators to perform the minimum number of queries
>     in order to only retrieve min an max rate
> 
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
> 
> Finally, patch 15 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
> 
> Most notably in this V3 I had:
> 
>   - picked up Geert fixes on V2: these could have been squashed in the
>     original series while maintaining proper Geert's authorship but as of
>     now I have simply picked them up and changed their order to be near the
>     commit they fix
> 
>   - dropped the "Harden Clock protocol initialization" patch that caused a
>     number of out-of-spec vendor FW to break
> 
> Based on v7.1-rc1.
> Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

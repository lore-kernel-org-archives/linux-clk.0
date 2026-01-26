Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0825FA05
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417528; cv=none; b=j9PPdg+YGw4mtpVnYX3DXKy8xAr/Hm6m8Ef4GtroCWYLz9JSyVqQJskUmgc3xUSCvYtVvFb6W/anPDjSQbcsBVfDhJAQcfm2tbdZRcoklwMIcWKLquIMOStgkWeW22M0zlxHGq1zG0foh9J9VLCjmUXaPcGmnV+zHzMndOHKz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417528; c=relaxed/simple;
	bh=TLkXqYKpSqGIF9m9YlZDkmtkUpG99yxhWYiQCbLH5oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIGZW9Uw/xU08RQmJ6XoJtLq4CWwgsas6a8U8IFpoRjw28b4LwaozTJQXO/qhkNU07/n74M7udX/ojSMjLQE8Hd13+ZvH4UFXJ9Y/AZdJ1IQma6tZPFRZPwLkTX6OuoDenD1srtgkTdGOcMGc+NmlFIfxwscvJNyrW1xmNDyRPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K/FVmWzl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K/FVmWzl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2321086f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 00:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417526; x=1770022326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLDylGBgP4+0IDkOEoHKFXTC/FLN28f1/8owaqv4294=;
        b=K/FVmWzlm7hOn+po3KcwWCNtIZiXf7oSkBuwqBMl2hiVStds2ICJbO+xiF1vNRQIFQ
         OToPKBtCr1fxKXJi70jMYYv/OdS9dagjv/Osn8IlOckeO47uSJyZOsRcLeer4C/99fyF
         N+uI0icPG4o4sWnSzyo3RlT3JayIH4u9W7Mxw47KfXW/TT3/VbyQxh550w8SvJiqmUdn
         XuIQ7g4DIXHnRxTp9VwBusZmHD1gXk6tfxcLIdIFehOgibNKvrJFkFRerGjQLrn1739Z
         gmBHfr/By9ah9TXZQcO+Y10alY3JonwswUD6JPy7TQSETGe7oEXYIGQyQXeVjahhHWoo
         mfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417526; x=1770022326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLDylGBgP4+0IDkOEoHKFXTC/FLN28f1/8owaqv4294=;
        b=c4KpyJjSTYxXEB8yqJvaouXGm0EjYPe+15ZfU/o/on29oMVFYdbNLca9KJHl15COnO
         MZko3dQend+aS7IdaPP0pnUtca2Ed6GLN5WhifemiH9+xnVNy5i1MdlO7IXzRYvV+n6O
         vbudi8DQV+B0XvG/DBBepzKOaaUr6OgbyNifPbb7nKbf946jasBL6EEmc0Ze2hjHpd13
         tmDSk6qdZNCQXf77KRH5o34ITdyRl79AHPzEMqxp2tS45lXCQx0ggKeuPcoaJYvhvDZ1
         rC0mThaSbG6BW2eYXRIkIgq/dwciDkAab9s9CvLdMaftkmq6wnfyOJ8NLrvZLQe9Kz1R
         mcxg==
X-Forwarded-Encrypted: i=1; AJvYcCW+kxmwNNV2yLsB/rZQIDtZyoHHZyVJqJttVO4BPA7/DicV0zJ7le+wJ0U8YDzzTGUHq/WMXS9Rm28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eJRlY0eRtkm3Ojr3ZqxP9YJoC1W/PEMzfc3ZCOo63lIRMeNO
	KYPJJaprhIclmaMtb9+XIZngRwd0ExqfIC6x0pbXTItHSUtsoIMzoSDsgQbysauUbnA=
X-Gm-Gg: AZuq6aIhatOlCIgNXwxSCgpzIXbpP0Mrr3Lik5B10MzvucSvtcLHszUwDS4moGcqFbJ
	/s1A/pgvyuh4rRpWhen5VhgPzHpVkmk0QJq4uNZ1YYTWZZyd1vOOzcJkcKzL69aoUZp1wk1nJox
	y2bUB71WShIu1nT1q+/A/iK22312SC87naAZOMKoi+ri99PQEM6BN0El00JOtwRbOFxQjmqfoQo
	fhdiWwIUUv4fCtmramyjoAuRtxVfXIOkiCEW1j0y8WUg+1ZquvyyQz9QZ0UJgK7fdLiZFSGnA+H
	dGB41yiysZcnnROERFcdn+THY2LUwPlph+bJFME5vZfCai1s1hZWcFcXSUm+95UqjJZufiQzryX
	5+CO1BwYXIsbDPVt3+2FkrCWf38C82PlT/lvuLnNESj/7+w1qPlKvUge84gYF27XaCx/dckCXUd
	A+CxDl6yPreSiFx/FbBA==
X-Received: by 2002:a05:6000:26c1:b0:435:a0f5:c276 with SMTP id ffacd0b85a97d-435ca1acefemr5343349f8f.61.1769417525632;
        Mon, 26 Jan 2026 00:52:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm28203098f8f.5.2026.01.26.00.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:52:05 -0800 (PST)
Message-ID: <61a9cabe-082f-4d43-b25e-5696831972c9@tuxon.dev>
Date: Mon, 26 Jan 2026 10:52:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/31] clk: at91: clk-peripheral: switch to
 clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <c3ecf1983df013da6e1c295f1fa6faf40b2919f9.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c3ecf1983df013da6e1c295f1fa6faf40b2919f9.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for peripheral clocks.
> The clk_parent_data is a more modern approach to the clock parent
> registration.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X7 SoCs to the use the
> structs.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


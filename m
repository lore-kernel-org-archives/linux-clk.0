Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B115E1F4CB3
	for <linux-clk@vger.kernel.org>; Sat,  8 Nov 2025 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762596376; cv=none; b=eVT+7fSfyahKpPTF9qWxC43lTj+3aQlK/74GBmp6SsTz5jKBcXlV6ML57bx/mmh0yyrl3FykOvC+Y678eDpEUGpGNp93oH5pmO/URPvarml0ZTNuR52FWuZB6OjYxevNSn9vgkY+chVOtd+u9qo+PU75RsXCQKlFgejQsT76s9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762596376; c=relaxed/simple;
	bh=VAT68V4JAW7j3YsERRqYU0IbuX+/A0bGz5WwsQ6WMMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmYf7Bp4X/jNwH1MqauLB20+8xFlLqZrE+avPawM+lCGYYI2n2SFHNXUjNf7oSEcC9caUbirn5WAPjuAd0tAgWU0SwkG0uJxR61K152XKN3mxwD5fiZ065ImW0SP9yLDmkENBT1xoEV8xlrEvPx8Rfy1PMoL3HMTKTuDpq/VUxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cVzQjiCZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cVzQjiCZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so10421745e9.3
        for <linux-clk@vger.kernel.org>; Sat, 08 Nov 2025 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762596370; x=1763201170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuDirgtJC0pc2QYVGZiTYLia1kGQp76vyqI+KUDhplM=;
        b=cVzQjiCZeHSzanBQlpyJKh4+z3LPuU8uh5dXUBFZdHU7g9r5PhBqfFXByH7iEweGLJ
         mvDmsrmjzqtUK2I40fcZVnGX0nSQ+s5J94RAmrNtLYsGc0St3EZU82tK5wjO+rRiQivS
         ACW0+OU/D9YAkNVRU4sm3aszjUbDGW5SHPCAmu5++4uJA6h4YnI8w34uYxztK/X71O0J
         UwCnLOdp/WCU/xfFJxegr/yn18ildIeVXRCucPs1vUwphh0vkqRv0elbGnwNhGn3dyBf
         zdE+NTHQT4T16PIZgV9KMDdN8x9vyEj889riGRxF1hjtGGt8Ifg8E7OR6JncAUOVv2FS
         JdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762596370; x=1763201170;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuDirgtJC0pc2QYVGZiTYLia1kGQp76vyqI+KUDhplM=;
        b=Ft+m8Nax6f3V4d11uNBCZcD1tHfHphpL6d3UYzzXFycTo0s/9qhB0wVOpjf86xmY1J
         SmKrurQzev9OX4XyLJfxBTu4QBfu+5u5GPtAwuBhkBUA3UBxmO0NYokTHBT0HsDtAaa/
         nKnF9P8AqAS1p4leUpKlUCOZ8Z4BWCIrHEzASiqhAAPlwZtfPyvqCv6Sh11ICdqnrDiq
         X48f6JaeMFVL/WgmiSIe9ZDr180wgV8aoTq1+7BpNRCwLDeTK8C1zZ5Wxx6ChzknCpB7
         UpjgtFgDqyE7JZfd/fGIFtdkYjRFNYyIlLcvtzUxnYGbpS3vSOhhaQhF0YRanuhR/P4d
         p6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjwAVtHWeIElJUzzeFQ2wW+pw22CKxLCXoUnXLGEdvbqAoMxdbnjGnMFzTFDjR4UrzGdo3utTGn78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhk27BdNjvBjVbS5BOV1JtlBu96YprQD6tQodzjHpLTrMcBXVX
	uaXgUL0/1OEUbyxZ4+5dpZRSO0AdKuKt9sh+8aDxIz14wBbe3H6pOi7+YRIuGPVqUDk=
X-Gm-Gg: ASbGncuEQycdkg2GV9a+aXFzDM23+3xlqx5dgQfBuTdG7+NA5gLaY0gh3ChJ/M34Faz
	9tW7XIkJaLVtpdsg2yqXzEqYalujjhooPOjRf7SnwpGakABkUDzowTDTGIUrKd1WqYyGqcHeUXY
	2T3t6M5LEDoVF5YV1K4lEjlYtivPs+yT0vLf6REcJJh9UdCgGHEyL1OGcGq9uqCE9bX0zggJvx+
	qWi0lGpWmCg4MZBgkT9/51WIlQYPPsfmRBPSQLzMB5tub2sPHTASv/jLwoRFo5XITG1Bnjnoyxa
	KHkIROQe4ZEwCG0E4sZlnit/1S0OPu6cmSVgDILJgqYKH1InrCxUq/6mgjYR6t4nilpJmer/S9W
	73KKthiYcKUTDW1vgIkEBBp20J3c1hAd2vnbxhohrFQvpvVWgT9ZuTZnLumD+Y86o6d5Uc6AxTJ
	EJ73v7VnzzzSI4X6usnq0=
X-Google-Smtp-Source: AGHT+IEwTvJbTnqOqFEBuH//I389Jc3uyJjik9sgRzeUh7VNXL0eHgm1ckrlDuEIpXgostqWX0J+ZQ==
X-Received: by 2002:a05:600c:1c02:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-4777325b7a4mr18135395e9.15.1762596369980;
        Sat, 08 Nov 2025 02:06:09 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm123069375e9.14.2025.11.08.02.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 02:06:08 -0800 (PST)
Message-ID: <e250fc9e-5de9-47e2-8150-0319b2453fcb@tuxon.dev>
Date: Sat, 8 Nov 2025 12:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: lan966x: remove unused dt-bindings include
To: Robert Marko <robert.marko@sartura.hr>, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
References: <20250924202810.1641883-1-robert.marko@sartura.hr>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250924202810.1641883-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/24/25 23:27, Robert Marko wrote:
> In preparation for LAN969x support, all instances referring to defines in
> the LAN966x specific header were dropped, so its safe to drop its inclusion
> in the driver.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Applied to clk-microchip, thanks!


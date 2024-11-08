Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C91E1C19
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731059957; cv=none; b=aNDJK5k6KfsjZdyw4k3/v4BqHeiCyaZMXVgJlXZx61Vp/gQb2pfWC9c1eJvdflGF63uuNBrHmevowPdHTQ43TtmI3rFBlxDTj/96NZZhZ0ADOPjrClMofpZjaq8juEQ38UuykTglga+ywYh5vGp5p35sJg27V72m5Arn+l0GsrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731059957; c=relaxed/simple;
	bh=favIJ0RU0Z1kVo0+cj+p8TtzOVJuzqN1053K+zk2H3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QXJEYqwqqEed/ZwO9O+LAQXCFeEJFmTCRzQitTPjnS6w1OdexCluBd7lyLAZPiaGj2iPOkF2bvDv9+sEMSxdLOQil/DwZryokrrqRqZj6mqxf8aVRi3O/2vLeKmroL4O/2yhQ/Scdj8csqmBsp80Y3AXG5mi//1jHTlpKX0qDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DX1HwiBR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DX1HwiBR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so15881125e9.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731059953; x=1731664753; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTIHfF+UH1Xa7DK8o/xh7XL9H7nZTNldWgZ8nJ8rQE0=;
        b=DX1HwiBRwhGXitdHvqQR2GUb0yuMG/hW9E7sDsDJVkq3IAvNfBcNnBSonDnMckfvp9
         iQLsC5m0tzIgXMKscNxxSL5AJ1yFVz9k1wllbwVMg0yRzYPvh801Xv/f7OIGVJEltItM
         fUj7cOCqZ+q/X7wp1ansYdELaBTjzNMFmL41fbIZR5dPbgo9rJKZn+qSBS7En1ozX/WV
         avczIqxECniiFbpCuFgBJrXURyEu7HB/lpQIJLPoW6p4WqaaMHvQOoWVR0+M/UGwOrxA
         zRk8mGkhHr0e/HXZ3fxU0R6UxTPMLcHcrmTlCFqwvDGnkVqwpxqLArI9nt7NJyvCs4fO
         n9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059953; x=1731664753;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTIHfF+UH1Xa7DK8o/xh7XL9H7nZTNldWgZ8nJ8rQE0=;
        b=ao9FRv8LCUwVdtpr3diRlNkn79drP3SzTD3R0L9wZIUQcqQe746fCSDMfi/4YMq6iZ
         ssPnXkRK4koetq0GxADGnRxvdXTpZ6wkcAeMtKHj9MmYFjGqHnnt2UAIIAHzO+QJTIOH
         2JdiFh8Ta28iMVAQCZ+U+XYIuQZj0U61ELyggCTNzN8t2guya9DD4ow4bTQFKDxG3HPF
         63kDlLkVuoJ/r0aH4Rr0xLf+rGc945YQkzvZ7CJeikKEJq6euFrHsYaQ5Q11CIeJfb/C
         98teyyUKanyba3s8QOQgXcWRJdl3G55ebHAr2Sj8R4eo9ZjIbmma7+WZX99Gu4UXOQac
         apdg==
X-Forwarded-Encrypted: i=1; AJvYcCURQVnTDLG2bjjf0G1KZViGXzk7PZSDH0Xpym5DVncsIM18bnzNsQV4LQ6XHp5jGIFUhmwuIZtRbAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxud+A6zuDAM5tiAICga+mT/bf8ZcF2CKIroRBQnkUKuKLpvaRD
	wdkq1tM7CS+VBgC8uzDqY+Yy/X5JLefnpJFu+Gdrf9gAX74LOyK1jy3UCfoLc9A=
X-Google-Smtp-Source: AGHT+IE52uNEd1M4kmQsGgrrxZ5e+HBgRbQ6hYCN5h70Y/Y7u6ZLc+ouQ9mgPck15oFzZ/AUamay2Q==
X-Received: by 2002:a05:600c:4f87:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-432b7508053mr18099615e9.18.1731059953350;
        Fri, 08 Nov 2024 01:59:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0530599sm58205685e9.1.2024.11.08.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:59:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
In-Reply-To: <85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com> (Chuan Liu's
	message of "Fri, 8 Nov 2024 17:23:53 +0800")
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
	<20241004133953.494445-1-jbrunet@baylibre.com>
	<07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
	<1jttci2k8k.fsf@starbuckisacylon.baylibre.com>
	<85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com>
Date: Fri, 08 Nov 2024 10:59:12 +0100
Message-ID: <1jcyj62gi7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 08 Nov 2024 at 17:23, Chuan Liu <chuan.liu@amlogic.com> wrote:

>>>> -       if (core->flags & CLK_IGNORE_UNUSED)
>>>> +       /*
>>>> +        * If the parent is disabled but the gate is open, we should sanitize
>>>> +        * the situation. This will avoid an unexpected enable of the clock as
>>>> +        * soon as the parent is enabled, without control of CCF.
>>>> +        *
>>>> +        * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock without
>>>> +        * forcefully enabling a whole part of the subtree.  Just let the
>>>> +        * situation resolve it self on the first enable of the clock
>>>> +        */
>>>> +       if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
>
> At first, I couldn't grasp the logic behind the 'return' here. Now it's
> clear. This approach is equivalent to completely giving up on
> handling clocks with CLK_OPS_PARENT_ENABLE feature in
> clk_disable_unused_subtree().
>

No. It's handled correctly as long as the tree is in coherent state.

What is not done anymore is fixing up an inconsistent tree, by this I
mean: A clock with CLK_OPS_PARENT_ENABLE, which report enabled from its
own registers but has its parent disabled.

In that particular case, clk_disable_unused_subtree() won't be turning on
everything to properly disable that one clock. That is the root cause of
the problem you reported initially. The clock is disabled anyway.

Every other case are properly handled (at least I think).

>>>>                   goto unlock_out;
>>>>
>>>>           /*
>>>> @@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>>>>
>>>>    unlock_out:
>>>>           clk_enable_unlock(flags);
>>>> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
>>>> -               clk_core_disable_unprepare(core->parent);
>>>> +       return (core->flags & CLK_IGNORE_UNUSED) && enabled;
>>>>    }
>>>>
>>>>    static bool clk_ignore_unused __initdata;
>>>> @@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
>>>>           clk_prepare_lock();
>>>>
>>>>           hlist_for_each_entry(core, &clk_root_list, child_node)
>>>> -               clk_disable_unused_subtree(core);
>>>> +               clk_disable_unused_subtree(core, true);
>>>>
>>>>           hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>> -               clk_disable_unused_subtree(core);
>>>> +               clk_disable_unused_subtree(core, true);
>>>>
>>>>           hlist_for_each_entry(core, &clk_root_list, child_node)
>>>> -               clk_unprepare_unused_subtree(core);
>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>
>>>>           hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>> -               clk_unprepare_unused_subtree(core);
>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>
>>>>           clk_prepare_unlock();
>>>>
>>>> --
>>>> 2.45.2
>>>>
>> --
>> Jerome

-- 
Jerome

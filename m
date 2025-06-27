Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F32EA72E
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044217; cv=none; b=Ykmv0+ibh58ZWJj+GiGPd8S3L7S+bABSFcfipbG671iUUcC+Dnjd5LAEU9YmKXqHAjMYIHo3yB3wRZYT+N6Zm7oPTl92joXfDInYv+I71LUsLDR5ocKs2v+Ob+V5t+FImF3/ZJG3acyqQGZIkHUEqLQgHYPrccJhR7WCMj2+tko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044217; c=relaxed/simple;
	bh=ppdYl7lHbi/tBjei3K4fVc93zG6F8OmMk6u5o6UCQ60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxUIa1H8kJY6wkuOTqTRP9bvpC7g3FQ6F5zIEHCpegm9VCRJ+HwRju4tE6/cjCl+WEWmrrFiXdvZQ0N8AXkfK4CFV8uMshbvotzF88cL/xqL1VkxslHddGIwwlYQPunqjsyaB3/vRR+yI3bg2TaVQSUjezo8tSXLFniV6+GDZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZSVh4MWm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZSVh4MWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751044214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NmwfJQJV+c9wJ1hezhGH5ZiqOmaiPpTqYKUu0exw8Qg=;
	b=ZSVh4MWmPEBYq9l33wBql1j/Ed4OI4zjqRhTbMv4bbN0i5q+xnUGG4+Cbg2sGCgXQvVNqa
	h8cjYZQgXdjGgZ4FnzZTkgjU8IytmGuVYvErmco+kYQ+xiDGE5KK+hSXc3cbdxax3oO0Px
	nkIZI9NfpNsHPks5KXq8ShZALAw7H/w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519--FRilOqgOZCIGfTNzFAu6A-1; Fri, 27 Jun 2025 13:10:12 -0400
X-MC-Unique: -FRilOqgOZCIGfTNzFAu6A-1
X-Mimecast-MFC-AGG-ID: -FRilOqgOZCIGfTNzFAu6A_1751044211
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so521785e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 10:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751044211; x=1751649011;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NmwfJQJV+c9wJ1hezhGH5ZiqOmaiPpTqYKUu0exw8Qg=;
        b=YGI07uWi4MTbiOfIxPt66YvBL3R+Xm76EsrUmRKL0pBoOPHDXBhjpSvJNYi8NOttCE
         U6uClNpVxhvALxLh82Y3KjmqcjHAzYRTBd/JKmH6iS03B9RtYIQqsStKtPlw0yefjXVe
         A5El68Q8J2JCU1Qgrxo/oU526rOfR522VKKf0cgAdgCowaeaMYLbQ+5RH5yoNAxh+mIe
         xnFQBVkEHN/7BsVGSFzc/1M5oo6bHKsWNmea8367b6WmAhsUdzlAgj0zMnHDGFzJg4YF
         i9sxKLVqHS1erUio5Fbh74ykZ+Mzwkou5w0bzgl7Da0Czunc+KSVbwD8H8LM6brz/rRW
         TtLg==
X-Forwarded-Encrypted: i=1; AJvYcCXGJadLg4x8/BCxbZHKCf/tycKqXzBaYjt/6WTqf8zAfjY60Q6e6FlgPmlhM+jNYP/auYwESPrwAqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzHZvvenQZgudVk3Kp7HawLx+x0Kb9t2MNXyub0FNwe0tAryx
	GhBxBk3JQj7ULi0GpnnDaoglYUHUH56FhkCAiMQ9zazYz4ZlDSfgZte+2WRlwBzCHZGnlo8PCAI
	XNaRnhmLn85meEOa/poR21yUFbZwouCH5roWffyJ40TGaBoMH8J8mn1+1SsAjaQ==
X-Gm-Gg: ASbGncsTG1V2tJA3CbDkI9kohoULUxWi/BadT1/o3n2k+XJlAO+DOUPrzsRNJJ3hIhL
	UFqDuvnvhJaaeo/TnxH0Gpz2DIK8t4XEPx8/5Ex/6ScmVeRJwrgL8xB6Gc7gD7gHbBwGvEgP4PX
	uReYmRfZfyR6U4G1haRhkDCMSVXgrK5A1mykJoGi3Y7g1I6h+OeBLCZCIuJ332hIA9q+SsqjNvd
	WdLHXps68A1PCvff+AprYnsHkOloXBMQV7pvw4muqL2yfdpAlufyeFdTfXqQH3aeBKBbFRBfhlA
	I0uHKNBDLm0gauE5aDnXQ91ieb1iHQm/IxaHmDJ+sevUqZsXng/620Zjl1nXfbd3WbyLuy8SiDv
	os+Y4xTpGrO5KfqaLluXrvtG/8AbwJkqQlVTsL5zszAFWs9ykqQ==
X-Received: by 2002:a05:600c:4f4f:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-453918aefb4mr33153695e9.4.1751044210209;
        Fri, 27 Jun 2025 10:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFejtdyP+lgBSZANc8+ODwaGeOy8e3cABckJGW0iKDwJz7VcuhqUT4sLBN4DTsX9Nc58Z5tEw==
X-Received: by 2002:a05:600c:4f4f:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-453918aefb4mr33153355e9.4.1751044209704;
        Fri, 27 Jun 2025 10:10:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3c7csm85945735e9.36.2025.06.27.10.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:10:09 -0700 (PDT)
Message-ID: <04116d0f-2815-4583-853e-e4295fb3d014@redhat.com>
Date: Fri, 27 Jun 2025 19:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] MAINTAINERS: Include GDB scripts under MEMORY
 MANAGEMENT entry
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Uladzislau Rezki <urezki@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Kuan-Ying Lee <kuan-ying.lee@canonical.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Etienne Buira <etienne.buira@free.fr>,
 Antonio Quartulli <antonio@mandelbit.com>, Illia Ostapyshyn
 <illia@yshyn.com>, "open list:COMMON CLK FRAMEWORK"
 <linux-clk@vger.kernel.org>,
 "open list:PER-CPU MEMORY ALLOCATOR" <linux-mm@kvack.org>,
 "open list:GENERIC PM DOMAINS" <linux-pm@vger.kernel.org>,
 "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MAPLE TREE" <maple-tree@lists.infradead.org>,
 "open list:MODULE SUPPORT" <linux-modules@vger.kernel.org>,
 "open list:PROC FILESYSTEM" <linux-fsdevel@vger.kernel.org>
References: <20250625231053.1134589-1-florian.fainelli@broadcom.com>
 <20250625231053.1134589-9-florian.fainelli@broadcom.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250625231053.1134589-9-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 01:10, Florian Fainelli wrote:
> Include the GDB scripts file under scripts/gdb/linux/ that deal with
> memory mamagenement code under the MEMORY MANAGEMENT subsystem since
> they parses internal data structures that depend upon that subsystem.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>   MAINTAINERS | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cad5d613cab0..52b37196d024 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15812,6 +15812,10 @@ F:	include/linux/mmu_notifier.h
>   F:	include/linux/pagewalk.h
>   F:	include/trace/events/ksm.h
>   F:	mm/
> +F:	scripts/gdb/linux/mm.py
> +F:	scripts/gdb/linux/page_owner.py
> +F:	scripts/gdb/linux/pgtable.py
> +F:	scripts/gdb/linux/slab.py

Probably they should go to the corresponding sub-sections. At least slab.py?

-- 
Cheers,

David / dhildenb


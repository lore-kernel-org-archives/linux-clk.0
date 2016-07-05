Return-Path: <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 6/7] meson: clk: Add support for clock gates
To: =?UTF-8?Q?Alexander_M=c3=bcller?= <serveralex@gmail.com>,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-7-git-send-email-serveralex@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Message-ID: <b42e2bb3-2cd0-3115-9be4-16e3a48b46fd@codethink.co.uk>
Date: Tue, 5 Jul 2016 19:01:14 +0100
MIME-Version: 1.0
In-Reply-To: <1467741391-60534-7-git-send-email-serveralex@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 05/07/16 18:56, Alexander Müller wrote:
> This patch adds support for the meson8b clock gates. Most of
> them are disabled by Amlogic U-Boot, but need to be enabled
> for ethernet, USB and many other components.
> 
> Signed-off-by: Alexander Müller <serveralex@gmail.com>
> ---

This seems to be a lot of structures for clocks that may
never be use. I think it would be better to provide a custom
lookup function that creates these as needed and use the ID
in the dt as a offset+bit id.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
